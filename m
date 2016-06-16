Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVt4t026gzDqrW
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 05:00:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466103641664994.7925219966138;
 Thu, 16 Jun 2016 12:00:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation v2] Port automation suite from the
 mkumatag personal repo without history
Date: Thu, 16 Jun 2016 14:00:39 -0500
Message-Id: <20160616190040.28577-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 19:00:47 -0000

All these files came from https://github.com/mkumatag/openbmc-automation
The decision to remove the commit history was because most of the 122
commits did not follow commit comment AND content best practices.
The ability to remove the commit history was possible because all
contributors where from the same company (IBM) making the coordination /
notification/acceptence easy.  See all the gory details about the
first try to commit with history here...
https://github.com/openbmc/openbmc-test-automation/pull/1

This suite of tests will run against an OpenBMC based server.  It will
run good/bad path testing against the REST interface.  There are tests
that will also run ipmitool on the victim BMC too.

If you want to support a new system in to the suite you should only
have to edit two files...
    data/<system>.py
    tox.ini

The README.md contains details on how to setup for the first time along
with how to execute the test suite

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc-test-automation/2)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc-test-automation/pull/2

Chris Austen (1):
  Port automation suite from the mkumatag personal repo with history

 .gitignore                                      |   6 +
 .project                                        |  17 +
 .pydevproject                                   |   7 +
 LICENSE                                         |   1 -
 README.md                                       |  69 +++
 data/Barreleye.py                               | 756 ++++++++++++++++++++++++
 data/Firestone.py                               | 626 ++++++++++++++++++++
 data/Garrison.py                                | 626 ++++++++++++++++++++
 data/Palmetto.py                                | 327 ++++++++++
 data/model.py                                   |  59 ++
 data/variables.py                               | 148 +++++
 lib/disable_warning_urllib.py                   |  16 +
 lib/ipmi_client.robot                           |  36 ++
 lib/pdu/pdu.robot                               |  15 +
 lib/pdu/synaccess.robot                         |  16 +
 lib/pythonutil.py                               |  11 +
 lib/resource.txt                                |  37 ++
 lib/rest_client.robot                           | 149 +++++
 lib/utilities.py                                | 105 ++++
 lib/utils.robot                                 |  54 ++
 requirements.txt                                |   5 +
 tests/data.json                                 |   1 +
 tests/security/test_ssl.robot                   |  38 ++
 tests/test_ac_cycles.robot                      |  25 +
 tests/test_association.robot                    | 219 +++++++
 tests/test_boot.robot                           | 161 +++++
 tests/test_bootpolicy.robot                     | 136 +++++
 tests/test_esel.robot                           |  61 ++
 tests/test_eventlog.robot                       | 196 ++++++
 tests/test_fan.robot                            |   6 +
 tests/test_fw_version.robot                     |  22 +
 tests/test_generic_conf.robot                   |  93 +++
 tests/test_inventory.robot                      |  97 +++
 tests/test_led.robot                            | 195 ++++++
 tests/test_networkd.robot                       | 314 ++++++++++
 tests/test_obmcrest.robot                       | 333 +++++++++++
 tests/test_occ_powercap.robot                   | 130 ++++
 tests/test_openbmc_service_restart_policy.robot |  60 ++
 tests/test_power_restore.robot                  |  82 +++
 tests/test_sensors.robot                        | 281 +++++++++
 tests/test_syslog.robot                         | 145 +++++
 tests/test_time.robot                           |  67 +++
 tests/test_user.robot                           | 301 ++++++++++
 tests/test_warmreset.robot                      |  52 ++
 tools/generate_argumentfile.sh                  |  13 +
 tox.ini                                         |  71 +++
 46 files changed, 6184 insertions(+), 1 deletion(-)
 create mode 100644 .gitignore
 create mode 100644 .project
 create mode 100644 .pydevproject
 create mode 100755 README.md
 create mode 100755 data/Barreleye.py
 create mode 100755 data/Firestone.py
 create mode 100755 data/Garrison.py
 create mode 100755 data/Palmetto.py
 create mode 100755 data/model.py
 create mode 100644 data/variables.py
 create mode 100644 lib/disable_warning_urllib.py
 create mode 100755 lib/ipmi_client.robot
 create mode 100644 lib/pdu/pdu.robot
 create mode 100644 lib/pdu/synaccess.robot
 create mode 100644 lib/pythonutil.py
 create mode 100755 lib/resource.txt
 create mode 100644 lib/rest_client.robot
 create mode 100755 lib/utilities.py
 create mode 100644 lib/utils.robot
 create mode 100644 requirements.txt
 create mode 100755 tests/data.json
 create mode 100644 tests/security/test_ssl.robot
 create mode 100644 tests/test_ac_cycles.robot
 create mode 100755 tests/test_association.robot
 create mode 100644 tests/test_boot.robot
 create mode 100644 tests/test_bootpolicy.robot
 create mode 100644 tests/test_esel.robot
 create mode 100644 tests/test_eventlog.robot
 create mode 100644 tests/test_fan.robot
 create mode 100644 tests/test_fw_version.robot
 create mode 100755 tests/test_generic_conf.robot
 create mode 100644 tests/test_inventory.robot
 create mode 100644 tests/test_led.robot
 create mode 100755 tests/test_networkd.robot
 create mode 100644 tests/test_obmcrest.robot
 create mode 100644 tests/test_occ_powercap.robot
 create mode 100644 tests/test_openbmc_service_restart_policy.robot
 create mode 100644 tests/test_power_restore.robot
 create mode 100644 tests/test_sensors.robot
 create mode 100755 tests/test_syslog.robot
 create mode 100755 tests/test_time.robot
 create mode 100755 tests/test_user.robot
 create mode 100644 tests/test_warmreset.robot
 create mode 100755 tools/generate_argumentfile.sh
 create mode 100755 tox.ini

-- 
2.8.4
