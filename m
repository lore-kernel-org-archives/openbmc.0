Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsY1SDPzDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="g0oZwDj+"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id f201so16439632oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=g0oZwDj+zBc8EmS8APXoRFqnMZh/4K7hpOpQAn1yK/LD/9IS+WPG0mEXm/beppr4ad
 LPtXzubwTlBL4qKI9ribaiPHB/zfWhaJEoKNKS+SNMUVk+8J7kV33bMGIccJ4KjJMWOf
 ENM1OIwDRRDg4siWfVDtY/Pbg2sT8+EHGNYG9w5yJL1vuY6omCzqcEsEXa+PCsGagl4M
 6vpR0V3nbP4ziQHpAeYLOa7lH2gUBrM52i0154zUi3iRqDMe+YsPtxMn0C/k++08Vido
 U5LjPGwC9hQj9kOd6FuI7RAx8hC38Zwx06PKpkoBIZHuxcAoRVsbEPYc8IHmOkQHduEO
 +8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=ktnNCwTs79bmcWL8IIgB7E9llgzQixZfyxXD0bjCnppbFUw6uPWDKKYiLoBAC6dZdi
 9j5qFdaTzgl8iYUiybTvIEg/OSksbHwYZ2QZpSAsb19XzrZNR2BqxDbBk0jHHwpIbp8a
 uaPD7S5b9iae75m+8jro1j7UM8hrpaWR1gcAAsdggZ/Hylk0DXxx3vA4pMdQnG6nHbPd
 9KoLAGa1xEI/UdsemV7pAVCB66n2L7WDF5/2MW/cwJMlshoxQph77ppjizNDWdn8WPTj
 MygOePID92XyUxywS3NfgQCvysnDw2iclt5IPDIhxK336ferNgYK2XPpI+ZeEKTkCQfR
 +60Q==
X-Gm-Message-State: AKaTC00jaugSObzLW27J7GwC3InrltxdnISA7J6nAk2hH+C3MiCOpeGKkwEeCvtGCV0Oyg==
X-Received: by 10.157.11.68 with SMTP id p4mr8297862otd.113.1479696063547;
 Sun, 20 Nov 2016 18:41:03 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.02
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:03 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au
Subject: [PATCH linux 06/19] fsi: enable debug
Date: Sun, 20 Nov 2016 20:40:35 -0600
Message-Id: <1479696048-75851-7-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailman-Approved-At: Mon, 21 Nov 2016 13:57:36 +1100
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:05 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Enable debug for the fsi core during development. Remove before
submission.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index ce9428d..db1a1ce 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -13,6 +13,8 @@
  * GNU General Public License for more details.
  */
 
+#define DEBUG
+
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/module.h>
-- 
1.8.2.2
