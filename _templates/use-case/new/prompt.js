const fs = require('fs');
const path = require('path');
const pluralize = require('pluralize');

const toClassName = (str) => {
  return str
    .split('-')
    .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
    .join('');
};
const getMockValue = (type) => {
  switch (type) {
    case 'string': return "'mock-string'";
    case 'number': return 123;
    case 'boolean': return true;
    case 'Date': return 'new Date()';
    default: return 'null';
  }
};
module.exports = {
  prompt: ({ inquirer, h }) => {
    const questions = [
      {
        type: 'select',
        name: 'moduleName',
        message: 'Which module does this use case belong to?',
        choices: fs
          .readdirSync(path.join(__dirname, '..', '..', '..', 'src'))
          .filter(
            (f) =>
              fs
                .statSync(path.join(__dirname, '..', '..', '..', 'src', f))
                .isDirectory() && !['shared', '_templates'].includes(f),
          ),
      },
      {
        type: 'select',
        name: 'useCaseType',
        message: 'What type of use case is this?',
        choices: ['Command', 'Query'],
      },
      {
        type: 'input',
        name: 'useCaseName',
        message() {
          const type = this.state.answers.useCaseType || 'use case';
          return `What is the ${type.toLowerCase()} name? (e.g., create-story, get-story-by-id)`;
        },
        validate: (val) => {
          if (!val.length) return 'Name cannot be empty.';
          if (!val.includes('-'))
            return 'Name should be kebab-case (e.g., get-by-id).';
          return true;
        },
      },
      {
        type: 'input',
        name: 'returnType',
        message: 'What is the return type? (e.g., Story, Story[], void)',
        default: (answers) => {
          const singularClassified = h.inflection.classify(
            pluralize.singular(answers.moduleName),
          );
          return answers.useCaseType === 'Command'
            ? 'void'
            : `${singularClassified} | null`;
        },
      },
    ];

    return inquirer.prompt(questions).then(answers => {
      const { moduleName, useCaseName, useCaseType } = answers;
      
      const pluralName = moduleName;
      const singularName = pluralize.singular(pluralName);
      const classifiedSingular = h.inflection.classify(singularName);
      
      const classifiedUseCase = toClassName(useCaseName);
      
      const useCaseFileName = `${useCaseName}.${useCaseType.toLowerCase()}`;
      const handlerFileName = `${useCaseName}.use-case`;

      // --- NEW DYNAMIC LOGIC FOR MOCK DATA ---
      const domainFilePath = path.join(__dirname, '..', '..', '..', 'src', pluralName, 'domain', `${singularName}.ts`);
      let mockCreateProps = `name: 'Test Name'`; // Default
      let mockCommandArgs = `'Test Name'`; // Default

      try {
        const domainFileContent = fs.readFileSync(domainFilePath, 'utf-8');
        const propertyBlockRegex = /\/\/ HYGEN-DOMAIN-PROPERTY-START([\s\S]*?)\/\/ HYGEN-DOMAIN-PROPERTY-END/;
        const match = domainFileContent.match(propertyBlockRegex);

        if (match && match[1]) {
          const properties = [];
          const propLineRegex = /(\w+)\s*:\s*(\w+)/g;
          let propMatch;
          while ((propMatch = propLineRegex.exec(match[1])) !== null) {
            properties.push({ name: propMatch[1], type: propMatch[2] });
          }
          
          if (properties.length > 0) {
            const createProps = properties.map(p => `      ${p.name}: ${getMockValue(p.type)}`);
            mockCreateProps = `name: 'Test Name',\n${createProps.join(',\n')}`;

            const commandArgs = properties.map(p => `${getMockValue(p.type)}`);
            mockCommandArgs = `'Test Name', ${commandArgs.join(', ')}`;
          }
        }
      } catch (error) {
        console.warn(`\nWarning: Could not parse domain file for mock data. Using defaults.`);
      }

      return {
        ...answers,
        pluralName,
        singularName,
        classifiedSingular,
        classifiedUseCase,
        useCaseFileName,
        handlerFileName,
        mockCreateProps,
        mockCommandArgs,
      };
    });
  },
};