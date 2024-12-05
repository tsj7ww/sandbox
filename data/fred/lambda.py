from .main import run

import logging
log = logging.getLogger(__name__)


def lambda_handler(event, context):
    """"""
    run()