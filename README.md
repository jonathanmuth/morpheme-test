# Morpheme – Heroku Starter

## Getting Started

Start by clicking on ["Use this template"](https://github.com/diesdasdigital/morpheme-heroku-starter/generate) to create your own copy of this repo. Clone it to your local machine, and open a terminal at the project's directory.

## Deployment

Click here to provision a brand new Morpheme application on Heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/diesdasdigital/morpheme-heroku-starter)

For subsequent deployments, we recommend configuring [Github Integration](https://devcenter.heroku.com/articles/github-integration), so that your application will be automatically redeployed whenever you push to your nominated branch.

Otherwise, please refer to Heroku's [Deployment](https://devcenter.heroku.com/articles/git) docs to see what other strategies are available to you.

## Local Development

To spin up your own local instance of this application, follow these instructions:

1. Ensure that you have [`docker`](https://docs.docker.com/get-docker/) and [`docker-compose`](https://docs.docker.com/compose/install/) installed.
2. Create a `.env` file at the project root, using [`.env.sample`](https://github.com/diesdasdigital/morpheme/blob/main/.env.sample) as a template. Fill in all of the secret values.
3. Optionally, edit `config.json` if you wish to override any configuration defaults. Refer to [`docs/CONFIG.md`](https://github.com/diesdasdigital/morpheme/blob/main/docs/CONFIG.md) for more details.
4. Optionally, edit `replacements.json` if you wish to augment the built-in replacements. Refer to [`docs/REPLACEMENTS.md`](https://github.com/diesdasdigital/morpheme/blob/main/docs/REPLACEMENTS.md) for more details.
5. Start the application with `docker-compose up --build`.

## Upgrading to a new Morpheme release

You can track the available Morpheme versions on the [Morpheme Releases page](https://github.com/diesdasdigital/morpheme/releases).

When a new release is available, you can edit your `Dockerfile` to change the version (the part after the `:`)

```diff
- FROM ghcr.io/diesdasdigital/morpheme:old-version
+ FROM ghcr.io/diesdasdigital/morpheme:new-version
```

Then, you'll need to trigger a new Heroku deployment (see [Deployment](#Deployment) above).

## Configuring AWS and Google Cloud

Morpheme uses the Google Cloud Text-to-Speech and Natural Language APIs to generate audio from text. The resulting audio files are stored on Amazon S3.

You will need both a Google Cloud account and an AWS account to setup the application, they should be configured according to the steps below.

### AWS

- [Login to the AWS S3 Console](https://console.aws.amazon.com/s3/).
- [Create an S3 bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-bucket-overview.html).
- [Create an AWS Access Key](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html) via the [Security Credentials Page](https://console.aws.amazon.com/iam/home?#security_credential) of the AWS Console and store it in a secure place.

### Google Cloud

- [Login to the Google Cloud Console](https://console.cloud.google.com).
- [Create a new Service Account/Project](https://cloud.google.com/iam/docs/creating-managing-service-accounts) for your instance of Morpheme from the [Service Accounts Page](https://console.cloud.google.com/iam-admin/serviceaccounts) of the Google Cloud Console.
- [Enable](https://cloud.google.com/service-usage/docs/enable-disable) the [Cloud Text-to-Speech](https://console.cloud.google.com/marketplace/product/google/texttospeech.googleapis.com) and [Cloud Natural Language](https://console.cloud.google.com/marketplace/product/google/language.googleapis.com) APIs for the service account you just created.
- [Create a Service Account Access Key](https://cloud.google.com/docs/authentication/getting-started) and store the JSON key file in a secure place.

The Google Cloud and AWS credentials need to be added as Config Variables to the app for it to be deployed successfully. You'll be prompted to enter them in Heroku's "Create New App" interface after clicking the "Deploy to Heroku" button.

To connect the app to S3 the 'Access Key ID', 'Secret Access Key' and the name of the bucket need to be entered in Heroku's setup form. To use Google Cloud APIs the contents of the JSON key file need to be copied in the corresponding field to the same form.
