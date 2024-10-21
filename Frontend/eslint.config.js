import js from "@eslint/js";
import prettier from "eslint-plugin-prettier";
import react from "eslint-plugin-react";
import reactHooks from "eslint-plugin-react-hooks";
import reactRefresh from "eslint-plugin-react-refresh";
import simpleImportSort from "eslint-plugin-simple-import-sort";
import globals from "globals";

export default [
  { ignores: ["dist", "node_modules", "build"] },
  {
    files: ["**/*.{js,jsx}"],
    languageOptions: {
      ecmaVersion: 2020,
      globals: globals.browser,
      parserOptions: {
        ecmaVersion: "latest",
        ecmaFeatures: { jsx: true },
        sourceType: "module"
      }
    },
    settings: { react: { version: "18.3" } },
    plugins: {
      react,
      "react-hooks": reactHooks,
      "react-refresh": reactRefresh,
      prettier,
      "simple-import-sort": simpleImportSort
    },
    rules: {
      "prettier/prettier": [
        "error",
        {
          tabWidth: 2,
          trailingComma: "none",
          semi: true,
          arrowParens: "always",
          endOfLine: "auto",
          useTabs: false,
          singleQuote: false,
          printWidth: 120,
          jsxSingleQuote: false
        }
      ],
      // Turn off other ESLint rules that conflict with Prettier
      "no-console": "off",
      "no-eval": "off",
      "react/react-in-jsx-scope": "off",
      // Simple import sort rules
      "simple-import-sort/imports": [
        "error",
        {
          groups: [
            // Packages `react` related packages come first.
            ["^react", "^@?\\w"],
            // Internal packages.
            ["^(@|src)(/.*|$)"],
            // Side effect imports.
            ["^\\u0000"],
            // Parent imports. Put `..` last.
            ["^\\.\\.(?!/?$)", "^\\.\\./?$"],
            // Other relative imports. Put same-folder imports and `.` last.
            ["^\\./(?=.*/)(?!/?$)", "^\\.(?!/?$)", "^\\./?$"],
            // Style imports.
            ["^.+\\.?(css)$"]
          ]
        }
      ]
    }
  }
];
