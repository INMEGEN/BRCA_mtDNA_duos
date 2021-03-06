# Strelka Workflow

The script "Strelka_Workflow.sh" contains the steps to run consecutive analyses of Strelka pairs of samples (tumors and normals).

We need to:

* Run the five steps in the "align_scripts" folder.
* Install Strelka following [the instructions](https://sites.google.com/site/strelkasomaticvariantcaller/home/strelka-workflow-installation).
* Run "Strelka_Workflow.sh"

Edit the script to set the location where strelka was installed (in this case /home/hachepunto/opt/strelka_workflow/), and the path to the directory where the analysis was run (in this case the folder strelka).

* Step 1. Move to working directory
* Step 2. Copy configuration ini file from default template set to a local copy, possibly edit settings in local copy of file
* Step 3. Configure each run of strelka for any pair of samples
* Step 4. Enter each folder and run the analysis with the "make" command.

The output structure of the results is described [here](https://sites.google.com/site/strelkasomaticvariantcaller/home/somatic-variant-output)
