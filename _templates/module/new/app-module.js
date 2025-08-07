module.exports = [
  // Action 1: Inject the import statement.
  {
    type: 'inject',
    to: 'src/app.module.ts',
    before: '// HYGEN-IMPORT-ANCHOR (Do not delete this line)',
    unless_exists: '<%= pluralClassifiedName %>Module',
    body: "import { <%= pluralClassifiedName %>Module } from './<%= pluralName %>/<%= pluralName %>.module';",
  },
  // Action 2: Inject the module name into the @Module imports array.
  {
    type: 'inject',
    to: 'src/app.module.ts',
    before: '// HYGEN-IMPORTS-ARRAY-ANCHOR (Do not delete this line)',
    unless_exists: '<%= pluralClassifiedName %>Module',
    body: '    <%= pluralClassifiedName %>Module,',
  },
];