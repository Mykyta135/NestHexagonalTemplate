const pluralize = require('pluralize');

module.exports = {
  prompt: ({ inquirer, h }) => {
    const questions = [
      {
        type: 'input',
        name: 'name',
        message:
          'What is the name of the new module (e.g., user, product)? (singular)',
        validate(value) {
          if (!value) {
            return 'Module name cannot be empty.';
          }
          if (/\s/.test(value)) {
            return 'Module name cannot contain spaces.';
          }
          return true;
        },
      },
    ];

    console.log('--- Hygen: Starting prompt ---');

    return inquirer.prompt(questions).then((answers) => {
      try {
        const { name } = answers;

        const lowerCaseName = name.toLowerCase();
        const pluralName = pluralize(lowerCaseName); // e.g., 'stories'
        const classifiedName = h.inflection.classify(name.replace(/-/g, '_')); // e.g., 'Story'
        const singularName = lowerCaseName;
        const pluralClassifiedName = pluralize(classifiedName); // Use pluralize on the Classified name
        const repositoryMethods = ['save'];

        const upperCaseName = name.toUpperCase();

        const result = {
          ...answers,
          lowerCaseName,
          pluralName,
          singularName,
          classifiedName,
          pluralClassifiedName,
          upperCaseName,
          repositoryMethods,
        };

        console.log('--- Hygen: Successfully calculated all variables ---');
        console.log(result);
        console.log('----------------------------------------------------');

        return result;
      } catch (error) {
        console.error('!!!!!!!!!! FATAL ERROR IN PROMPT.JS !!!!!!!!!!');
        console.error(error);
        return { name: 'error' };
      }
    });
  },
};
