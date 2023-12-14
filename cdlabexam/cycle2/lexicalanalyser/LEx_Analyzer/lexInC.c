#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int isKeyword(char buffer[])
{
    char keywords[38][10] = {"auto", "break", "case", "char", "const", "continue", "default",
                             "do", "double", "else", "enum", "extern", "float", "for", "goto",
                             "if", "int", "long", "register", "return", "short", "signed",
                             "sizeof", "static", "struct", "switch", "typedef", "union",
                             "unsigned", "void", "volatile", "while", "scanf", "printf", "stdioh", "stdlibh", "main", "include"};
    int i;
    for (i = 0; i < 38; ++i)
    {
        if (strcmp(keywords[i], buffer) == 0)
        {
            return 1;
        }
    }
    return 0;
}

int main()
{
    char c, buffer[31], operators[] = "+-*/%=";
    FILE *fp;
    int i, j = 0;
    int in_string_literal = 0; // 0 = Not in string literal, 1 = Inside double quotes, 2 = Inside comment
    printf("Joyal Mathew\n");
    fp = fopen("input.txt", "r");

    if (fp == NULL)
    {
        printf("Error while opening the file\n");
        exit(0);
    }

    while ((c = fgetc(fp)) != EOF)
    {
        if (c == '\n')
        {
            in_string_literal = 0; // Reset string literal flag at the end of each line
        }

        if (in_string_literal == 0 && c == '"')
        {
            in_string_literal = 1; // Start of a string literal
        }
        else if (in_string_literal == 1 && c == '"')
        {
            in_string_literal = 0; // End of a string literal
            printf("String literal: \"%s\"\n", buffer);
            j = 0;
        }
        else if (in_string_literal == 0 && c == '/' && (c = fgetc(fp)) == '*')
        {
            in_string_literal = 2; // Start of a comment
            buffer[j++] = '/';
            buffer[j++] = '*';
        }
        else if (in_string_literal == 2 && c == '*' && (c = fgetc(fp)) == '/')
        {
            in_string_literal = 0; // End of a comment
            buffer[j++] = '*';
            buffer[j++] = '/';
            buffer[j] = '\0';
            printf("Comment: %s\n", buffer);
            j = 0;
        }
        else
        {
            if (in_string_literal == 0)
            {
                for (i = 0; i < 6; ++i)
                {
                    if (c == operators[i])
                        printf("%c is operator\n", c);
                }

                if (isdigit(c))
                {
                    printf("%c is a digit\n", c);
                }
                else if (isalpha(c))
                {
                    buffer[j++] = c;
                }
                else if ((c == ' ' || c == '\t' || c == '\n' || c == '(') && (j != 0))
                {
                    buffer[j] = '\0';
                    j = 0;

                    if (isKeyword(buffer) == 1)
                        printf("%s is keyword\n", buffer);
                    else
                        printf("%s is identifier\n", buffer);
                }
            }
            else
            {
                buffer[j++] = c; // Add character to the string literal or comment buffer
            }
        }
    }
    fclose(fp);
    return 0;
}
