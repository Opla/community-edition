Deprecated see https://github.com/Opla/opla

# opla.ai
The ultimate chatbot builder.

[![pipeline status](https://gitlab.com/licarth/cv-dev/badges/master/pipeline.svg)](https://gitlab.com/licarth/cv-dev/commits/master)

[![Build Status](https://travis-ci.org/Opla/community-edition.svg?branch=master)](https://travis-ci.org/Opla/community-edition)

In 5 minutes you create your own conversational assistant using this opensource tool.

# Getting started

## Quick start for Unix users (Linux, Mac)

### From master :

```
curl -fsSL https://github.com/opla/community-edition/raw/master/install.sh -o install.sh
chmod +x install.sh
./install.sh
```

You should then be able to navigate to http://front.localhost/ and create your chatbot.

### From a specific revision/branchg/tag :
```
export REV=feature/install-script
curl -fsSL https://github.com/opla/community-edition/raw/$REV/install.sh -o install.sh
chmod +x install.sh
./install.sh --rev $REV
```

## For Windows (non-unix) users / alternative to install.sh

### Prerequisites
- `docker` and  `docker-compose`

### Build and run

```
docker-compose up
```

You should then be able to navigate to http://front.localhost/ and create your chatbot.


# licence
GPL v2.0+
