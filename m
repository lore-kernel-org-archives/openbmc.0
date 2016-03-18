Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRZZB1RPhzDq5s
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2016 06:10:57 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14583282544889.8842201731444;
 Fri, 18 Mar 2016 12:10:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-rest-server 0/4] pep8,
 miscellaneous rest server updates
Date: Fri, 18 Mar 2016 14:10:44 -0500
Message-Id: <1458328248-2382-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Fri, 18 Mar 2016 19:10:58 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-rest-server/16)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-rest-server/pull/16

Brad Bishop (4):
  Run through pep8
  Use pyobmc package
  Added a license to obmc-rest file
  Enumerate with org.freedesktop.DBus.ObjectManager

 obmc-rest | 1454 ++++++++++++++++++++++++++++++++-----------------------------
 1 file changed, 753 insertions(+), 701 deletions(-)

-- 
2.7.1
