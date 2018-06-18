Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::244; helo=mail-pg0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mW5ensX9"; 
 dkim-atps=neutral
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418H545vNMzF0XQ
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 13:43:52 +1000 (AEST)
Received: by mail-pg0-x244.google.com with SMTP id r21-v6so6884074pgv.4
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jun 2018 20:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=s3nSyz5nXkYpORCAtmCfayBh6umcuPlXgdSSovC07cs=;
 b=mW5ensX9CEzI13zJCGCEMn9vau688TSCKu79LYWGZrjSULBVyZFwuOvI5aTjA8Iv+V
 M5sKs1m9XKoaI7gBlmqslgr1oP4nAkRcRGjo5UN2NPSb+3h8LUxZvNEvdaLK5D9yvxbs
 HzxIygwFKqlQ540loXIaTVpgGo8dlIBYUjKAx4qDNYsvPQIYH8s0MoK+Oi3i10pbuVxE
 NdmbHlCOy4daybHkO9bBny25H2MhL4WuxcOKrIRD9yGOBhmnKHlhMbUHUdXd/X/dFV21
 fqQEICTvRK+Sih3a/I62WFrUQWoyjNCDz6jF1h/QrYI6C1hPhkeAP9duzN6+8/HDY9vv
 b16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=s3nSyz5nXkYpORCAtmCfayBh6umcuPlXgdSSovC07cs=;
 b=mPj5ERjPP1lWBPJ5QmN2SwcoBL87vacT4U6/lyaHjS5oFn4Buh4DHKSO2U42aiyakE
 O+yc129fOKgz7FL0ytFLBzoCk5+dG5+vE/jTO9dsrIbimjZxpEpqZz2ztvna41aozbJ4
 diyEf+LfX2WXX5clL1etvppAXyTBG39PjofctWQyTydNklcWsr7Ux3MkOoT75OTT8uyx
 nDjLHLJ2FWQhUKvdU8IjIJnRnqb1iTfgyF49rgOdJbnBOsinjbPpSKqNx/eUgv51p7Xs
 8hhWmxVzugwJ19u+1U5Q5b82KcpktrEU2b05Qjus34HkTksTHI8fqCOTLaQapMsh6ggE
 38HQ==
X-Gm-Message-State: APt69E1sepjQke70GSX3odss/8pDvgjLmMjzk+b1fFYSn8s8xUWxQiB4
 +1ZjNgopAluGsBluAXgGwlUX52A3
X-Google-Smtp-Source: ADUXVKLsl9rl/TTSfHHWKjEHeb52EVTYUjNoo3aK6eOamh/Q0O//fitbJwHG2ROIw7M32rom6/xUwg==
X-Received: by 2002:a62:d6d2:: with SMTP id
 a79-v6mr11820307pfl.87.1529293430710; 
 Sun, 17 Jun 2018 20:43:50 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id d9-v6sm22120924pfg.183.2018.06.17.20.43.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 17 Jun 2018 20:43:50 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 18 Jun 2018 13:13:45 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH 1/5] fsi-occ: Fix size_t printf
Date: Mon, 18 Jun 2018 13:13:31 +0930
Message-Id: <20180618034335.9732-2-joel@jms.id.au>
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
X-List-Received-Date: Mon, 18 Jun 2018 03:43:53 -0000

   drivers/fsi/fsi-occ.c:414:16: warning: format '%d' expects argument
   of type 'int', but argument 4 has type 'size_t {aka long unsigned
   int}' [-Wformat=]
      dev_dbg(dev, "Bad resplen %d\n", *resp_len);
                   ^                   ~~

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-occ.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index e4ebda646453..f02f72d379d0 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -411,7 +411,7 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
 	if (!occ)
 		return -ENODEV;
 	if (*resp_len < 7) {
-		dev_dbg(dev, "Bad resplen %d\n", *resp_len);
+		dev_dbg(dev, "Bad resplen %zd\n", *resp_len);
 		return -EINVAL;
 	}
 
-- 
2.17.1
