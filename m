Return-Path: <clg@kaod.org>
X-Greylist: delayed 34945 seconds by postgrey-1.36 at bilbo;
 Mon, 28 Aug 2017 02:46:08 AEST
Received: from 15.mo6.mail-out.ovh.net (15.mo6.mail-out.ovh.net
 [188.165.39.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgLPr03tmzDqDy
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 02:46:07 +1000 (AEST)
Received: from player787.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 0C308103D20
 for <openbmc@lists.ozlabs.org>; Sun, 27 Aug 2017 18:46:03 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id D9382600072;
 Sun, 27 Aug 2017 18:45:58 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.10 0/2] leds: pca955x: mainline update and I2C
 error checking 
Date: Sun, 27 Aug 2017 18:45:44 +0200
Message-Id: <20170827164546.22903-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17819336351602150146
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledruddtgddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Sun, 27 Aug 2017 16:46:08 -0000

Hi,

The GPIO extension to the pca955x driver should be part of 4.14-rc1
when the window opens. And so, the first patch of this series brings
the current driver of the openbmc 4.10 kernel to the same level. The
second patch adds I2C error checking which should help in detecting
bogus devices or bogus device trees at probe time.

Andrew,

I made some changes in patch 2/2.

Cheers,

C.

Cédric Le Goater (2):
  leds: pca955x: sync with mainline driver
  leds: pca955x: check for I2C errors

 drivers/leds/leds-pca955x.c | 142 ++++++++++++++++++++++++++++----------------
 1 file changed, 91 insertions(+), 51 deletions(-)

-- 
2.13.5
