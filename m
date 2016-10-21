Return-Path: <xow@google.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com
 [IPv6:2607:f8b0:400e:c00::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0srW3qKczDvck
 for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2016 04:20:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=bfCy4Pci; 
 dkim-atps=neutral
Received: by mail-pf0-x230.google.com with SMTP id r16so59989505pfg.1
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 10:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TFpcp528PSPyaT49MBY9iRdeCAoJSkdbjHDI+6JbzKA=;
 b=bfCy4Pcilfl+KQ1vASANNFAWxqFx8WF+LJ0opNB7+/mymobNWe+o7bTTgy9iDhjGd4
 KkVnEWdgjCIny1GtjVOAk1SuyszWSLPjdDCaZqd0ebqz51uJwfgLcJePwNWAINfcdnyb
 C3KYD9n/v5Jmyhhemv93BenZDMg5x7MWwPqMeukVCbatO/kRSjSRHMI43sxxRLBEu3kf
 e8bQenRyUhJ/bnu/vkTLtcCvMSODDCKaM8WMnVXJ73zAA+X0/7JPhnmi+pnt+LRorJyH
 YSya7/SCI96FDZZX2nE+BGeGKdP9zvygQXKSpMO5y2nX+z086lRblT9rQ8ftl5av4Mh+
 bDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TFpcp528PSPyaT49MBY9iRdeCAoJSkdbjHDI+6JbzKA=;
 b=ViJXsz3IUg4TTnJ1iI2pdurFHUFzW7dhLZATUMlQc7IxeszMx64LrERp1aSBCADh8f
 TltQKAS3/IDX0CVtgOxKyMQT56jaPENvq7lrvnumsnyj+NZEyjxFroxTzKnnX8Ekg4qt
 G0o0K6Xl7njn5JAlrMml37Onx9G9pDRBewWpl98/HOcPhjsbMhc2U0nlUy4Iu2TL575g
 A802TWX1FZwoVgNHLklKKU26CNZ11XRZQOcy5OQow86eItoA2AgqFuvko5VOAqZgF0R8
 +y2gOfAvbEshuuyZqzcTAjoZk9Wo5C/IuiLZaj7dfXIWX3O1sHRrCdL+iLLTSpKIDPvZ
 BF9A==
X-Gm-Message-State: ABUngvctGw/fRqozYjxKJ327wO0n/5h1hNtu82Upwmwa1xW8TGyLXa7xWmnhQ6gHXuNVfOIn
X-Received: by 10.98.80.2 with SMTP id e2mr3472968pfb.183.1477070424831;
 Fri, 21 Oct 2016 10:20:24 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id f129sm6594037pfc.3.2016.10.21.10.20.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Oct 2016 10:20:24 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: f.fainelli@gmail.com
Cc: davem@davemloft.net, jaedon.shin@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: [PATCH 0/2] Broadcom BCM54612E support
Date: Fri, 21 Oct 2016 10:20:11 -0700
Message-Id: <1477070413-92621-1-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 21 Oct 2016 17:20:28 -0000

This series is based on tip of torvalds/master.

The first patch adds register definitions from Broadcom docs.

The second patch adds the BCM54612E PHY ID, flags, and device-specific
RGMII internal delay initialization.

I tested on a custom board with an Aspeed AST2500 SOC with its second
MAC connected to this PHY.

Xo Wang (2):
  net: phy: broadcom: Update Auxiliary Control Register
  net: phy: broadcom: Add support for BCM54612E
