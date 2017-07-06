Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x37X60tWczDr3s
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jul 2017 16:44:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rBvAMz7J"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id u62so1661094pgb.0
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jul 2017 23:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=cpcc51ve4Kjp5qb+EEAGrk/I4p/I9BRFt3hlKuk29sg=;
 b=rBvAMz7Js0Az4Ss+iSuy+e3g+goCEIE6SUzm/dlZkRZ9OgvDLbYOfIjipwC6ryVz4y
 ziPM+w0hCgYHhnPaJ2g5yVZR6oRuN4yp759FjxBlLASGDTvM+O0lbbgdORU8DgqHYozy
 UqfGcJGh1XcxlrQQPfUIxFmWrOeyNTR0Ryy7EERhrmM8z8aBNyniKW2yTeG3DYWlK2L2
 nOJna/fcXmx5GRwVEgUats203n7/+spuBGd/mSvU3CE9Zvesqov4wErCWWqvRe2WC3wG
 2C4chRU3Z7dxuLGtXZfSUrEl8NmbJiJFecDYiim09hQKOrhvjIy0IQSEGvaVUBtaSzmU
 n7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=cpcc51ve4Kjp5qb+EEAGrk/I4p/I9BRFt3hlKuk29sg=;
 b=hh6tbrYqIt0DkdMOXwBBAsNjOx811VdtnVZowLVT8FHkEBG/7ifLwK8gG0tXMWiMu+
 nROlJxfkFhDpZYVH7kWVM0z90kUU/0DtCxSJ/WlgoIZ1qsmqdudDE95/9iVU+YPoOLzG
 eVNJKwJ0bnxMYZVfVXb923cXvH6Kv4AAAfOViXfu4yCQZg9Y8+vyUomMRMygHhj6LSFk
 vM0LrZ/FH8gTqS89PnkojyOxmrvtXdH3ZMJjqvLS1fqnmdbqVkVmGsvWsTst9ce9UbEL
 +UU22NXg4JorqZcY8YzkQeMlJTSElHl78K/15VX2z+tzfot44TQBW/8CnyBNxPIvKzAL
 CH3g==
X-Gm-Message-State: AIVw113HSxosydFhtHuE1TOZYjBWtq0Sv02gHler8pXgW9jgodFQIj3n
 oME9E5uYY2Qgcob3MmY=
X-Received: by 10.99.47.66 with SMTP id v63mr8756742pgv.4.1499323492053;
 Wed, 05 Jul 2017 23:44:52 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id o8sm1928348pgn.52.2017.07.05.23.44.49
 for <openbmc@lists.ozlabs.org>
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Jul 2017 23:44:51 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 06 Jul 2017 16:14:44 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] i2c: fsi: Add SMBUS emulation
Date: Thu,  6 Jul 2017 16:14:43 +0930
Message-Id: <20170706064443.16972-1-joel@jms.id.au>
X-Mailer: git-send-email 2.13.2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jul 2017 06:44:54 -0000

Userspace expects this to be enabled. For example, it is required for
using i2cdetect.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/busses/i2c-fsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index d5135b4bc607..952cf8f392b4 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -467,7 +467,8 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_10BIT_ADDR;
+	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_10BIT_ADDR
+		| I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
 static int fsi_i2c_low_level_recover_bus(struct fsi_i2c_master *i2c)
-- 
2.13.2
