Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4LxN3WWTzDqDW
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 13:21:12 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14629368689711.9553899840776694;
 Tue, 10 May 2016 20:21:08 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken1029@gmail.com>
Subject: [PATCH skeleton v10 13/22] Fix skeleton Makefile
Date: Tue, 10 May 2016 22:20:43 -0500
Message-Id: <1462936852-25327-14-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462936852-25327-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462936852-25327-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 11 May 2016 03:21:13 -0000

From: Ken <ken1029@gmail.com>

---
 Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Makefile b/Makefile
index 0752813..22ce5a6 100755
--- a/Makefile
+++ b/Makefile
@@ -88,9 +88,3 @@ hwmons_barreleye: hwmons_barreleye.o object_mapper.o libopenbmc_intf
 
 control_bmc: control_bmc_obj.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/control_bmc_obj.o $(LDFLAGS) $(LIBS)
-
-i2craw:  $(OBJS2) i2craw.o
-        $(CC) -o bin/$@ obj/i2craw.o $(LDFLAGS)
-
-info:   info.o
-        $(CC) -o bin/$@ obj/info.o $(LDFLAGS) $(LIBS_info)
-- 
2.8.1
