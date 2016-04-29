Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxRSN0vqBzDqB2
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 07:20:35 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461964832459757.8673703725614;
 Fri, 29 Apr 2016 14:20:32 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/5] new recipes, version bumps for associations
Date: Fri, 29 Apr 2016 16:20:26 -0500
Message-Id: <1461964831-393-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Fri, 29 Apr 2016 21:20:36 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/250)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/250

Brad Bishop (5):
  New recipe for pyphosphor library
  New recipe for openpower-inventory-upload
  Whitespace fixes for obmc-rest.bb
  Add pyphosphor requirement to rest-dbus
  Bump rest, mapper and rest-dbus versions

 .../images/obmc-phosphor-image.bbappend             |  3 +++
 .../inventory-upload/inventory-upload.bb            | 21 +++++++++++++++++++++
 .../meta-openpower/conf/layer.conf                  |  4 +++-
 .../common/recipes-phosphor/dbus/obmc-mapper.bb     |  2 +-
 .../common/recipes-phosphor/dbus/obmc-rest.bb       | 11 ++++++-----
 .../common/recipes-phosphor/rest-dbus/rest-dbus.bb  |  4 ++--
 .../common/recipes-phosphor/skeleton/pyphosphor.bb  | 15 +++++++++++++++
 7 files changed, 51 insertions(+), 9 deletions(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-phosphor/images/obmc-phosphor-image.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb

-- 
2.8.1
