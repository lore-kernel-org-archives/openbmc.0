Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYvdg5XmKzDqlF
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 03:21:11 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466529658728564.3087536101034;
 Tue, 21 Jun 2016 10:20:58 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 1/2] Remove built-in.o from repository
Date: Tue, 21 Jun 2016 12:20:52 -0500
Message-Id: <20160621172053.23689-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160621172053.23689-1-openbmc-patches@stwcx.xyz>
References: <20160621172053.23689-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 21 Jun 2016 17:21:12 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Added by mistake when pflash was originally imported.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 op-flasher/pflash/ccan/built-in.o | Bin 14873 -> 0 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 op-flasher/pflash/ccan/built-in.o

diff --git a/op-flasher/pflash/ccan/built-in.o b/op-flasher/pflash/ccan/built-in.o
deleted file mode 100644
index 510b477044d616baaac93a27fb8e987692f1ca71..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 14873
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
a;fX)$L9jpJp8w^xT5z#rI}P~D-2Vo!<voS~

-- 
2.9.0
