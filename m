Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::22f; helo=mail-pg0-x22f.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dVEoQuh1"; 
 dkim-atps=neutral
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnGRS4GbczDrJ7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 18:08:03 +1000 (AEST)
Received: by mail-pg0-x22f.google.com with SMTP id d8so13995757pgt.4
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 01:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1b5z6JpIDoUpafHPaYRR6ThXFGzVY5OlpKuqNKOZOJg=;
 b=dVEoQuh1Rp7ENcw8VU0TsfE7qxoCMI0rOPwyPDaxpjCMB1xiJ2dcgNh2DGTPZ847Lo
 pl7B8WwxquQcaqswZH8WveWm/op4p66BYxwjAaNb8CCD+acHGFiSfU4euVywjrkW587r
 zXb9DqIO3mL468ly9jYUtTHFGFvlDLIZifHjx23ZoiRxneZTeu4maEatLG9PNdQEj+H9
 HrrUU7thWiET4bELdhEJaUJqkICl+DIt9cvlr3B8jNpzm8A3e6FQFZkVSziUC2R3lrlm
 tuUZ1e+14fQ4132hC75teHez7YekAGEAqC8Vkv+WPDESRrfVNVZWNNxA6WbocoshWQPI
 gXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1b5z6JpIDoUpafHPaYRR6ThXFGzVY5OlpKuqNKOZOJg=;
 b=HgvFxS3/8kh5LOSmDcKQ0U8RBK0f8vuFxcWYc7sI0kPwBXYbpsCkpBS3Rp2kQuVojH
 /VtrrvRPmooAYqcjyT8qhIkAb6vz8u4JF/T73f+PJfFlT8i5Vo16Y2Kksb8O1/C0koZU
 bj7btN6Df+ILHO2yYWFKJMjP2GJi4LiRybZougci5MB8bRdIXah3JaqZlVJhWcnpsbrB
 qFb1/3gP2i2fY8rDb6Fv8cL92vtZkBSFXBA/fqgKCn/f+qXNDygW9Y4cVKg2QEbE6W1Z
 97GVEjXLWkVkeHMRUP3JHZ9Gx8838evqtWyZDtIiknPAjlTY7xDNiDmsGTnijTNMQ3nE
 BQSg==
X-Gm-Message-State: AHPjjUjxaku0wKZtO9jaiXyoZZ1FRO504Z2NpVvjnkvl30WKhqd+mHnD
 2C9UF/zyNJCIZqof
X-Google-Smtp-Source: ADKCNb5UeA9QrwiBhBqylnNjRjbV9k6qG6uBj5gwRoNCMBCt3Ns9JYeXtpyE8k0PB45ZnjjpOLMsCQ==
X-Received: by 10.99.63.135 with SMTP id m129mr6977385pga.207.1504685281382;
 Wed, 06 Sep 2017 01:08:01 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id b187sm1687620pfg.135.2017.09.06.01.07.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 06 Sep 2017 01:08:00 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH v4 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Wed,  6 Sep 2017 01:07:48 -0700
Message-Id: <20170906080751.6773-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
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
X-List-Received-Date: Wed, 06 Sep 2017 08:08:05 -0000
X-List-Received-Date: Wed, 06 Sep 2017 08:08:05 -0000

Addressed comments from:
  - Joel: https://www.spinics.net/lists/arm-kernel/msg605137.html

Changes since previous update:
  - Added SMP and SMP_ON_UP
  - Changed dts to use phandle
