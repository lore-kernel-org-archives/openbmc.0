Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::244; helo=mail-pg0-x244.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XoR2gjoT"; 
 dkim-atps=neutral
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLtlm2yMhzF0h6
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 15:05:08 +1100 (AEDT)
Received: by mail-pg0-x244.google.com with SMTP id c194so10587084pga.12
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 20:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=U6yjqe8JB1/+Pa3aouckJO04G2bvqQxuz7RODA1uC9E=;
 b=XoR2gjoT5QblomLl0OPZVQzdYuO8ShiI82vpi0rt8+EVE33h2C3T3GHfugTQ4fPUo+
 AtpTH/nDFy4I8r+oUxiNtKuoGxhIprbu9nir08GyzAN4qpVK0pMKQxk55UtJ2t6kHMzt
 LVGjge7zndErN2lZdFMYWBPT977cSwLDxZcBr1M7wnT4/Qv4p+qsp8zxcV+/qlZMRvg3
 /3dBrYNYFA+C29QBetwC03EEaPWNgKrru8un+NglNNM6g03zz89bOVxXMdsjiigER3/q
 GOul/RWB54VTs0T38wvHXeeMpGQ50sYLHVfG1F5e4K0/W5qgdKeL9NY3Nsu1eLsAv8+2
 vFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=U6yjqe8JB1/+Pa3aouckJO04G2bvqQxuz7RODA1uC9E=;
 b=tGv8cFjsgaizMFMkx7jrirpItgVlIEkMVn91ocYRffjweMfDEgA7N0ZZb16jyYdHlD
 kpSziyLvIVwnfpbM1wGcloq4ZpqLdOwbFJFrNKK5oawu6LF0gOJ6a1jpaFBmjvWllECJ
 FBqr67d38ll9yy4FvKYouKCdvGuERs1jFTftGUIQsiLdfPM32H5a5SGdyV0YyFPM4Lga
 DJIIG2ginoqkruPWpwb0uoQLaoY8ZF4W4SDhAXOaSAIgzt1ovtY2i8y6N8fHEvt43H0h
 Y1iaC7ab3BIUFjmFcVbrfIQWq5ODGVGrHw7uUkR56+qmEWdfMf2YS+yfIxuXEPQRX1Ka
 TiuQ==
X-Gm-Message-State: AKwxytdwi0oo9Sp8ONRD8iQJ5BSWGpzCUSlI3f5mkhhvARS3uF5xJnqN
 xundhbKBx9cQb10CH/sLlTNRmdCl
X-Google-Smtp-Source: ACJfBovlqkf9MMyzh9jxnDGnj6e/a+5FRTG74U/+X43Uyje3XsZ1Z/1EVjxO/SXIGmKw/sqbR9LzPQ==
X-Received: by 10.98.31.131 with SMTP id l3mr13496041pfj.116.1516161904881;
 Tue, 16 Jan 2018 20:05:04 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id w27sm5246288pge.54.2018.01.16.20.05.03
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Tue, 16 Jan 2018 20:05:04 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 3/3] hwmon: (w83773g) Fix fault detection and
 reporting
Date: Wed, 17 Jan 2018 12:04:02 +0800
Message-Id: <1516161842-16203-3-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1516161842-16203-1-git-send-email-mine260309@gmail.com>
References: <1516161842-16203-1-git-send-email-mine260309@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jan 2018 04:05:09 -0000

From: Guenter Roeck <linux@roeck-us.net>

Smatch reports:

drivers/hwmon/w83773g.c:105
	get_fault() warn: shift has higher precedence than mask

Code analysis shows that the code is indeed wrong.
Fix it, and while we are at it, drop unnecessary typecast.

Fixes: 86a10c802362 ("hwmon: Add W83773G driver")
Cc: Lei YU <mine260309@gmail.com>
Reviewed-by: Lei YU <mine260309@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83773g.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
index 0b97c28..e858093 100644
--- a/drivers/hwmon/w83773g.c
+++ b/drivers/hwmon/w83773g.c
@@ -102,7 +102,7 @@ static int get_fault(struct regmap *regmap, int index, long *val)
 	if (ret < 0)
 		return ret;
 
-	*val = (u8)regval & 0x04 >> 2;
+	*val = (regval & 0x04) >> 2;
 	return 0;
 }
 
-- 
1.9.1
