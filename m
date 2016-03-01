Return-Path: <adriana.kobylak@gmail.com>
Received: from mail-pa0-x22f.google.com (mail-pa0-x22f.google.com
 [IPv6:2607:f8b0:400e:c03::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 020CD1A035C
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 08:46:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=uMqFjOfh; 
 dkim-atps=neutral
Received: by mail-pa0-x22f.google.com with SMTP id fy10so119029620pac.1
 for <openbmc@lists.ozlabs.org>; Tue, 01 Mar 2016 13:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=Qp446GIRJMQD9yElkFMVZ7PIFDULQLsUkoT6Rhc7eNM=;
 b=uMqFjOfh4EKxFsJ9EF6X+Y9n6en1P9QaVMHkJ+FMUOoMo0WHAm/xppzYWgmRYIQUZX
 BtLbRLHCmGeL/J4Qx7skRWLSyutjC7K27MNWJmq1k1w7yZVHcIgyPz9m9+LUTQvaWzQM
 eHAeqPb3zgw1yv8WrMckE6OJYh3PK7CM78qnSjgdRiX44gVU7RgYNn6UpR/EjIftRhYX
 3OKdJDvoECsE+vqfZUzONC4xgdooAXO/6Pfn29o02bXvHDaROAFPh1e7Q1zjtHW7EuI/
 eG5ZCUNijqfliewJfZCN6P5B1GtXWhzUFo20pLi4wS8zgkiZkxG5unnocMmSSJITHalm
 jhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Qp446GIRJMQD9yElkFMVZ7PIFDULQLsUkoT6Rhc7eNM=;
 b=H3s/r5mBs2V+XZLv7FumkgwLNsC0k4WxZwb87kNJ8hY4CF/q6WCGm8YVRdFnHhB3SI
 hiV07sCHt0WIRiH9Vd24hY9H3dvV3Nnpmc2fQR4Q/oVSAIK6hJ6sEmZZp2TrKzSB1xZ+
 9RCDvpzu2oIe+yXR6KruxuXcZZ/CIzycugGGcdX7+RqteIVWkof00ztx9EPYzs42Pr/b
 hk3UHboP/Tw8csAVF93vbdFKFAUJCG86LEL7i1z1cnkOFfClajVPoo6sx7E2jSq9jfTS
 n7lqg7846XxBDXQSpEKvx+ObQV9y48he+fdB4aMEKExk4kQumWtgK0Ta2R+TL5ndW5EM
 91/w==
X-Gm-Message-State: AD7BkJLB+Bnt1htq19pRG8DuHPmHjtZcCc59iZF2KWK9PnQQ5XYpc+tsAg6kZckg+5LC8A==
X-Received: by 10.66.147.103 with SMTP id tj7mr33783586pab.72.1456868805675;
 Tue, 01 Mar 2016 13:46:45 -0800 (PST)
Received: from habcap11p1.aus.stglabs.ibm.com ([32.97.110.54])
 by smtp.googlemail.com with ESMTPSA id dg1sm47758194pad.18.2016.03.01.13.46.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 01 Mar 2016 13:46:45 -0800 (PST)
From: Adriana Kobylak <adriana.kobylak@gmail.com>
X-Google-Original-From: Adriana Kobylak <anoo@us.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Add temporary adm1278 hwmon pmbus driver patch
Date: Tue,  1 Mar 2016 15:45:49 -0600
Message-Id: <1456868750-46780-1-git-send-email-anoo@us.ibm.com>
X-Mailer: git-send-email 2.1.4
X-Mailman-Approved-At: Fri, 04 Mar 2016 02:53:11 +1100
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
X-List-Received-Date: Tue, 01 Mar 2016 21:46:48 -0000

From: Yi Li <adamliyi@msn.com>

Signed-off-by: Yi Li <adamliyi@msn.com>

Yi Li (1):
  Subject: Add temporary adm1278 hwmon pmbus driver patch

 .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |   3 +
 .../linux/linux-obmc/hwmon_adm1278.patch           | 165 +++++++++++++++++++++
 .../linux/linux-obmc/readme_adm1278.txt            |  78 ++++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   3 +
 4 files changed, 249 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend

-- 
2.7.1
