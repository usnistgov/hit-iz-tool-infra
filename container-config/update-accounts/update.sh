#!/bin/sh

mysql -h erx-account-db -u $TOOL_USER -p$TOOL_USER_PWD $TOOL_DB < /scripts/accounts.sql
