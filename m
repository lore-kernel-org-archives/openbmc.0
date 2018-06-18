Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::242; helo=mail-pl0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bI21zK2R"; 
 dkim-atps=neutral
Received: from mail-pl0-x242.google.com (mail-pl0-x242.google.com
 [IPv6:2607:f8b0:400e:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418H5C1V7bzF0nB
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 13:43:59 +1000 (AEST)
Received: by mail-pl0-x242.google.com with SMTP id w17-v6so8254422pll.9
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jun 2018 20:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pmM6GrBry3+0wTFYFMIp6jSHIxq3jsvPvfkT+fvHRtA=;
 b=bI21zK2RAb1rg3Epe747mSqrp+mFsVqx0WrPVoieOt/M29pIowpt4v0dx0/YQwGXn4
 osHR+5eezQjsAbWl20XI6Te6EiE3nTJ85EZAm1oIqDc3NyJFPjn0JwkYeT7JDp+57a+d
 JqkPB12pxJCQ6tXdKYrMS3BUE7JGIhDXDFCwNHIkBKkZmXIWK4fhP8vx6sXZNlHFLGl3
 n4aGysLUCbGst5Ndfj8+/XkosAcc4uI0je4NyeblA6TCo8GMnU5lee6f5nFTrfZuERKS
 4Ys7LuF8QcylB/s1Y2zaU1pM2g4PKnTDQt/yENFHfldob2avieeAV3GdzuklKwhuFOSj
 cb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pmM6GrBry3+0wTFYFMIp6jSHIxq3jsvPvfkT+fvHRtA=;
 b=sqth7Aj7HcoDE+mXy3Wn0zJd33ngp+7G8Ds+bSh7lw7BY1nlEWB21+HNMaABmhXB2+
 lu9bAXTMJPFO2MSh0okgAR+PvuX+bd91i0SSgxSHYGc7R+DEo0fn6jCLZwH/Z2yNRlyh
 NDQK1YjLCD4GqzE4zqPjpKoW/R2RL7hE7tJP5iv95h58b0J5ToJN7+h4/qTF5Oy3QLGt
 3O2Lv3x52enxHx1EWx2PGvuUxUt3o5Cq6bBGosCuOKZ/nkkTr8rTppWhD+AKwrYuYbX0
 bkbchXmeiZ5aei9ggzXAEIc6HP62EqattJX+nqfe8fn1lMBLAoUw4Gq8uFKyx3kF2IcW
 BidQ==
X-Gm-Message-State: APt69E3TVpN5itVJQDAMSYWCh+YWoTj9k0sgqWrtYTmOFsYD8sV/9LL7
 cr+/oJ8hEywwS/oMdzJSg7Ejg+TY
X-Google-Smtp-Source: ADUXVKL4TRp2xgz2hWQZUu4Pc7iRQYVzlrZCXNlFA0jEzkEwnDXXmaccrrDl3/Lhl2K/V0WJdOCxdg==
X-Received: by 2002:a17:902:2927:: with SMTP id
 g36-v6mr12073604plb.303.1529293436649; 
 Sun, 17 Jun 2018 20:43:56 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id d65-v6sm20663989pfj.20.2018.06.17.20.43.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 17 Jun 2018 20:43:56 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 18 Jun 2018 13:13:51 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH 2/5] hwmon (occ): Fix printf warning
Date: Mon, 18 Jun 2018 13:13:32 +0930
Message-Id: <20180618034335.9732-3-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180618034335.9732-1-joel@jms.id.au>
References: <20180618034335.9732-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 18 Jun 2018 03:43:59 -0000

   drivers/hwmon/occ/common.c:1351:24: warning: format '%d' expects
   argument of type 'int', but argument 5 has type 'long unsigned int'
   [-Wformat=]
     dev_dbg(occ->bus_dev, "Max resp size: %d+%d=%d\n",

   drivers/hwmon/occ/common.c:1351:24: warning: format ‘%d’ expects
   argument of type ‘int’, but argument 6 has type ‘long unsigned int’
   [-Wformat=]
     dev_dbg(occ->bus_dev, "Max resp size: %u+%zd=%d\n",

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/occ/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index c1bccf53b425..c5115a049032 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1348,7 +1348,7 @@ static void occ_parse_poll_response(struct occ *occ)
 		sensor->version = block->header.sensor_format;
 		sensor->data = &block->data;
 	}
-	dev_dbg(occ->bus_dev, "Max resp size: %d+%d=%d\n",
+	dev_dbg(occ->bus_dev, "Max resp size: %u+%zd=%zd\n",
 		 size, sizeof(*header), size + sizeof(*header));
 }
 
-- 
2.17.1
