Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::242; helo=mail-pl0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+Kv/3lt"; 
 dkim-atps=neutral
Received: from mail-pl0-x242.google.com (mail-pl0-x242.google.com
 [IPv6:2607:f8b0:400e:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418H5S0RJlzF0mQ
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 13:44:12 +1000 (AEST)
Received: by mail-pl0-x242.google.com with SMTP id a7-v6so8257350plp.3
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jun 2018 20:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=Vxo75N68UV3WxfYstR0u0Rma4talPrT5ZgBGfYmkg84=;
 b=c+Kv/3lt5ow3OzeAUknEs9uUry0XXIea64/zCkSaLCcbE5wf9ETjDYIl0Uu11m4Oak
 NVfS4MrEbaALe42qOjl1nCGa/uvjFf52eGS8afjv+mABXLrHWchmwU4lp0SNRpbEnmm1
 M12YSgOk8amq8puM/H3IAEHq55PiyZhUapEZWxmZN8SNlP6SopHSvf64u0MlzxwGZKAh
 xKeQnvtB02jr1poLql3gfjFNmDQCJWUX5A/dQY6teGqizv/ipa3T2KvCcs8jl0cZvQ1w
 06GKd3QS64+hlop/eOd0aVBN6XDOo9Xlb1xNRSVwBaTXb3hYr+NmQkoDbme0QUjhwIzZ
 cJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=Vxo75N68UV3WxfYstR0u0Rma4talPrT5ZgBGfYmkg84=;
 b=MrJg3JZbNhOVFWk6jsFBHI1I32ckCrqfWRs62GdkCFZNRo5vapx74JT/a+eh4KPKdA
 6n5PtTsP1Sb+LYMVPaO64X3mDaTAmTtuOZ858ijkbVoczhyJooK0Pb82D+l7KEV7Phu7
 FtbQV7N16rPWZeou8kCU7mc3qSrSCSLkFEzf+pXCfrwP34Hh43A1TCnb9BOlJwCKVcJ5
 TPcAJGArPIGTtuacafN/y02Lh6umUCmeEMYoWfRfNy2bM0aihkitpqHisJwSC6F0tF/V
 aPjtLtWAG/+Z7gpsDhKXA+vbDL0pZV22uHnTakUgXCH8eQAt7OvjT0c0w7nFfS612ad/
 SCAg==
X-Gm-Message-State: APt69E1ukrZG8gIQGR3cGae51LcMc//UOTBAI1ot7tsNSp9ny+tFdh2N
 NLS21mXd51iS+DrrTA1S00vJVlDo
X-Google-Smtp-Source: ADUXVKKEiWCZp/RcCgYDffeB3gEQfLc7IY5vbTLbQxejGKBVdNg2oo3cxgPSeHcLrnV999xMBVwVbA==
X-Received: by 2002:a17:902:654c:: with SMTP id
 d12-v6mr12177901pln.8.1529293449070; 
 Sun, 17 Jun 2018 20:44:09 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id d22-v6sm22836007pfk.126.2018.06.17.20.44.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 17 Jun 2018 20:44:08 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 18 Jun 2018 13:14:03 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH 4/5] fsi: master-hub: Fix sparse warnings
Date: Mon, 18 Jun 2018 13:13:34 +0930
Message-Id: <20180618034335.9732-5-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180618034335.9732-1-joel@jms.id.au>
References: <20180618034335.9732-1-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2018 03:44:12 -0000

fsi-master-hub.c:128:13: warning: incorrect type in assignment (different base types)
fsi-master-hub.c:128:13:    expected unsigned int [unsigned] [usertype] cmd
fsi-master-hub.c:128:13:    got restricted __be32 [usertype] <noident>
fsi-master-hub.c:208:13: warning: incorrect type in assignment (different base types)
fsi-master-hub.c:208:13:    expected restricted __be32 [addressable] [assigned] [usertype] reg
fsi-master-hub.c:208:13:    got int

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-hub.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 5885fc4a1ef0..b3c1e9debcf2 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -122,7 +122,8 @@ static int hub_master_write(struct fsi_master *master, int link,
 
 static int hub_master_break(struct fsi_master *master, int link)
 {
-	uint32_t addr, cmd;
+	uint32_t addr;
+	__be32 cmd;
 
 	addr = 0x4;
 	cmd = cpu_to_be32(0xc0de0000);
@@ -205,7 +206,7 @@ static int hub_master_init(struct fsi_master_hub *hub)
 	if (rc)
 		return rc;
 
-	reg = ~0;
+	reg = cpu_to_be32(~0);
 	rc = fsi_device_write(dev, FSI_MSENP0, &reg, sizeof(reg));
 	if (rc)
 		return rc;
-- 
2.17.1
