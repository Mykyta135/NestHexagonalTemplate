const fs = require('fs');
const path = require('path');
const pluralize = require('pluralize');

// Helper function to get a default value based on type
const getMockValue = (type) => {
  switch (type) {
    case 'string':
      return "'mock-string'";
    case 'number':
      return 123;
    case 'boolean':
      return true;
    case 'Date':
      return 'new Date()';
    default:
      return 'null';
  }
};

module.exports = {
  prompt: ({ inquirer, h }) => {
    const questions = [
      {
        type: 'select',
        name: 'pluralName',
        message: 'Generate a full test suite for which module?',
        choices: fs.readdirSync(path.join(__dirname, '..', '..', '..', 'src')).filter(f =>
          fs.statSync(path.join(__dirname, '..', '..', '..', 'src', f)).isDirectory() && !['shared', '_templates'].includes(f)
        ),
      },
    ];
    return inquirer.prompt(questions).then(answers => {
      const { pluralName } = answers;
      const singularName = pluralize.singular(pluralName);
      const classifiedSingular = h.inflection.classify(singularName);
      const pluralClassified = h.inflection.classify(pluralName);

      // --- NEW DYNAMIC LOGIC ---
      const domainFilePath = path.join(__dirname, '..', '..', '..', 'src', pluralName, 'domain', `${singularName}.ts`);
      let mockCreateProps = `name: 'Test Name'`; // Default
      let mockDtoProps = `name: 'Test Name'`; // Default

      try {
        const domainFileContent = fs.readFileSync(domainFilePath, 'utf-8');
        // Regex to find properties between the start and end anchors
        const propertyBlockRegex = /\/\/ HYGEN-DOMAIN-PROPERTY-START([\s\S]*?)\/\/ HYGEN-DOMAIN-PROPERTY-END/;
        const match = domainFileContent.match(propertyBlockRegex);

        if (match && match[1]) {
          const properties = [];
          // Regex to find individual property lines: e.g., "author: string;"
          const propLineRegex = /(\w+)\s*:\s*(\w+)/g;
          let propMatch;
          while ((propMatch = propLineRegex.exec(match[1])) !== null) {
            properties.push({ name: propMatch[1], type: propMatch[2] });
          }

          if (properties.length > 0) {
            const createProps = properties.map(p => `      ${p.name}: ${getMockValue(p.type)}`);
            mockCreateProps = `name: 'Test Name',\n${createProps.join(',\n')}`;
            
            const dtoProps = properties.map(p => `      ${p.name}: ${getMockValue(p.type)}`);
            mockDtoProps = `name: 'Test Name', ${dtoProps.join(', ')}`;
          }
        }
      } catch (error) {
        console.warn(`\nWarning: Could not parse domain file at ${domainFilePath}. Using default test data.`);
      }
      
      return { ...answers, singularName, classifiedSingular, pluralClassified, mockCreateProps, mockDtoProps };
    });
  },
};