const fs = require('fs');
const path = require('path');
const pluralize = require('pluralize');

module.exports = {
  prompt: ({ inquirer, h }) => {
    const questions = [
      {
        type: 'select',
        name: 'pluralName',
        message: 'Which module do you want to add a property to?',
        choices: fs.readdirSync(path.join(__dirname, '..', '..', '..', 'src')).filter(f =>
          fs.statSync(path.join(__dirname, '..', '..', '..', 'src', f)).isDirectory() && !['shared', '_templates'].includes(f)
        ),
      },
      { type: 'input', name: 'propName', message: 'Property name (e.g., email, price)?', validate: val => val.length > 0 },
      { type: 'select', name: 'propType', message: 'Property type?', choices: ['string', 'number', 'boolean', 'Date'] },
      { type: 'confirm', name: 'isOptional', message: 'Is this property optional (nullable)?', default: false },
      {
        // Re-introducing the advanced prompt for validators
        type: 'multiselect',
        name: 'validators',
        message: 'Select class-validator decorators (press <space> to select, <a> to toggle all)',
        choices: [
          // The 'name' is what the user sees and what the prompt returns.
          // The 'value' is not used by the prompt but is good for reference.
          { name: 'IsString', value: '@IsString()' },
          { name: 'IsNotEmpty', value: '@IsNotEmpty()' },
          { name: 'IsEmail', value: '@IsEmail()' },
          { name: 'IsNumber', value: '@IsNumber()' },
          { name: 'IsBoolean', value: '@IsBoolean()' },
          { name: 'IsDateString', value: '@IsDateString()' },
        ]
      },
      { type: 'confirm', name: 'isUnique', message: 'Is this property UNIQUE in the database?', default: false },
    ];
    return inquirer.prompt(questions).then(answers => {
      const { pluralName } = answers;
      const singularName = pluralize.singular(pluralName);
      const classifiedName = h.inflection.classify(singularName.replace(/-/g, '_'));

      // --- Logic to process validator answers ---
      const validatorImports = new Set();
      if (answers.isOptional) {
        validatorImports.add('IsOptional');
      }

      // `answers.validators` is an array of names like ['IsString', 'IsNumber'].
      const validatorNames = answers.validators;
      validatorNames.forEach(name => {
        validatorImports.add(name);
      });

      // Transform the names into full decorator strings for the template.
      const fullDecorators = validatorNames.map(name => `@${name}()`);
      
      return {
        ...answers,
        singularName,
        classifiedName,
        validators: fullDecorators,
        validatorImports: Array.from(validatorImports),
      };
    });
  },
};