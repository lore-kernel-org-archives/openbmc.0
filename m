Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 922251A0202
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:50:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531026977569.4982168332854;
 Mon, 11 Jan 2016 08:50:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 00/60] Pull Manjunath's automation
 repository
Date: Mon, 11 Jan 2016 10:49:26 -0600
Message-Id: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2016 16:50:31 -0000

Pull Manjunath's repository: https://github.com/mkumatag/openbmc-automation
into openbmc.

https://github.com/openbmc/openbmc-test-automation/pull/1

Chris Austen (16):
  Added DIMM specific inventory tests
  base add for sensor tests
  fixed review comments
  created loops for tests
  Add initial rest test cases     Support to test Null properties
  Added full sensor suite
  Update README.md
  Handle new rest client from Brad
  Added DIMM specific inventory tests
  base add for sensor tests
  fixed review comments
  created loops for tests
  Add initial rest test cases     Support to test Null properties
  Added full sensor suite
  Update README.md
  Handle new rest client from Brad

Manjunath A Kumatagi (34):
  Added git ignore file
  Use argumnet file with pyrobot and added instructions to READEME file.
  Update README for better html display
  Added Inventory list testcase
  fixed errors in tox and generate_argumentfile.sh script
  Moved Read Attribute and Read Properties to rest_client
  fix review comment
  Added SSL tests
  Ran the tests and fixed errors in SSL tests
  Modified the doc
  Added firmware version validation test
  update readme file with tox version
  Fix errors
  Fix Errors in test_obmcrest.robot and removed the empty testcases.
  Added one more testcase to test non-ssl connection to port 443
  OpenBMC REST Testing
  updated the REST API for firmware version
  Added git ignore file
  Use argumnet file with pyrobot and added instructions to READEME file.
  Update README for better html display
  Added Inventory list testcase
  fixed errors in tox and generate_argumentfile.sh script
  Moved Read Attribute and Read Properties to rest_client
  fix review comment
  Added SSL tests
  Ran the tests and fixed errors in SSL tests
  Modified the doc
  Added firmware version validation test
  update readme file with tox version
  Fix errors
  Fix Errors in test_obmcrest.robot and removed the empty testcases.
  Added one more testcase to test non-ssl connection to port 443
  OpenBMC REST Testing
  updated the REST API for firmware version

Manjunath Kumatagi (2):
  first commit
  first commit

manjunath (6):
  added files
  added log statement
  added testcase for etc passwd
  added files
  added log statement
  added testcase for etc passwd

mkumatag (2):
  Update README.md
  Update README.md
