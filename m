Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfjTx2LCWzDqwG
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 23:01:09 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467205264617730.6708975345722;
 Wed, 29 Jun 2016 06:01:04 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 1/2] libopenbmc_intf: Fix non-arm devmem
 implementation
Date: Wed, 29 Jun 2016 08:00:59 -0500
Message-Id: <20160629130100.25673-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160629130100.25673-1-openbmc-patches@stwcx.xyz>
References: <20160629130100.25673-1-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 29 Jun 2016 13:01:09 -0000

From: Joel Stanley <joel@jms.id.au>

Fixes the following error:

 In file included from button_reset_obj.c:4:0:
 ../libopenbmc_intf/openbmc.h:39:15: error: return type defaults to ‘int’ [-Werror=implicit-int]
 static inline devmem(uint32_t val, uint32_t reg)

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 libopenbmc_intf/openbmc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libopenbmc_intf/openbmc.h b/libopenbmc_intf/openbmc.h
index c1c0335..fe4deef 100644
--- a/libopenbmc_intf/openbmc.h
+++ b/libopenbmc_intf/openbmc.h
@@ -36,7 +36,7 @@ static inline uint32_t devmem_read(void* addr)
  //       write_reg(reg,val);
 //}
 #else
-static inline devmem(uint32_t val, uint32_t reg)
+static inline uint32_t devmem(uint32_t val, uint32_t reg)
 {
 }
 static inline uint32_t devmem_read(void* addr)
-- 
2.9.0
