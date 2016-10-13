Return-Path: <jaghu@google.com>
Received: from mail-pa0-x235.google.com (mail-pa0-x235.google.com
 [IPv6:2607:f8b0:400e:c03::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svX466PRWzDsxR
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 11:41:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=oJh+oxsZ; 
 dkim-atps=neutral
Received: by mail-pa0-x235.google.com with SMTP id rz1so33181873pab.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 17:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=/xiLKKxOtbsbVDm417nVo4TgB2SuzpPrvhkeV7pjiFo=;
 b=oJh+oxsZfr1DO2u4h9AEcewswUA6s6pc3T9pI//ewK0HtghDmwXAGKK6f/d/QfilLk
 aLz5vL4gqA+4dak4/CKlUv5MorXtprwNiQ6rJV/A1iD5vuHog61T//ec0acdCfYivhHu
 0WhA52HbCRo3hHnExhLjFmIvh/w6a5ZMZbJk17NCor+jb7VjvSrolNBQFgYA2Mms+IDs
 uv8ydFxGPyWf4GbeKVkHVIAf2jEB5H14PyTFPOQXtxR9pdryINn1zt5Q5awC3tcCaGxy
 OyCzKvv1QUWBJ7JnRw6ASFEZz0zZVDyTTeqOltjMvbrzYGfXXGa7veFDaw6WA0hQvGpM
 q6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/xiLKKxOtbsbVDm417nVo4TgB2SuzpPrvhkeV7pjiFo=;
 b=PUAeMRrFSV0pygRaLBjrK0dS0lZlBSv4bpjBdloVmp3aHL3HFVXOlNwrVnXhsh6IDL
 6gRfgahnErhKj4SHrexMhyNhWzXe3Jyqj1p1hsP3nte31X161ymKMVgsPZLBc/28AKio
 tuR6oeDBUIvflffmzBrJX0KTshNNPIPh0wiD5HVTDX6Tz2SVLeysyhQCSEww+0Y47bYs
 ceK/bcOw5OQHnfRtvZyHPl6m/xV62r2b3oulmqIasql00thZM3O9Lndo7+rc7gCpr/+W
 9/kry6QngeGqJeUpf3xbZGp0jbIDvPDW2cIsbrM64WL37BYXJz+zvhJXItY7OFYGk5OT
 jqoA==
X-Gm-Message-State: AA6/9RnY1yTAx3a6jz66HhzkG+LPJUUwXCioFcujhzWXebY8hrzhx5x1+6UXqVkdnF/Qu3mc
X-Received: by 10.66.6.3 with SMTP id w3mr5044376paw.172.1476319316535;
 Wed, 12 Oct 2016 17:41:56 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id v86sm14450239pfa.91.2016.10.12.17.41.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Oct 2016 17:41:55 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org
Subject: POST card display support 
Date: Wed, 12 Oct 2016 17:41:42 -0700
Message-Id: <1476319305-29981-1-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Thu, 13 Oct 2016 00:41:59 -0000

Platform driver in patch 1/3 periodically updates the most current POST code
from either the BMC or host to the POST card display.
The POST card hardware assumed is 74HC164 wired to two 7-segment displays.

(to get POST codes from bmc) On BMC state change, the character driver in
patch 2/3 is the interface to which the systemd (in openbmc) will write the
POST codes. When a new POST code is written to the character device,
the update_postcode function in patch 1/3 is called to update the post code.

(to get POST codes from host) When the host writes to port80, the lpc driver can
directly call update_postcode function in patch 1/3 to update the POST code
(will be written after lpc driver is finished);

patch 3/3 has devicetree info for controlling the POST card hardware on zaius
