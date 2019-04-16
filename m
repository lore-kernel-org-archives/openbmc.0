Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mCT2cDOr"; 
 dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kF9b1QVYzDqGp
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 05:02:26 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id a6so17912678oie.5
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 12:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2xFVuROxNGl2R58KGrGcsuJMKdYi5j7/8QSOffrK1rE=;
 b=mCT2cDOrpIFTyYD5mdPnG23Z67/ZOKJH7t34kai1a7eUEtmpTVCo+L/fXKyRI0e7nK
 RE8j+oLTadByHe0u0j/9oeqoecOJUSJfTcDSuRKr0XNPSwu7vi62NRxZkQK0D7N8wITy
 TB9XHEAoYdUqb3HCTnrilenbKdGNR+HJeXWkQZVBFw4tUx5CMzAFfkX02FiWNO1eXweV
 qC0iobCR+31BoLIhB8QAI2x8uB0RoRQGYKx4pV0j5gg8Y8DFE6Rzua+4ZmQTf2TrjTJ5
 gLx8Niu8xMxHWO6297GrrcGMmt+Eo+VRk5laz8cTi2JCqa9pUpfZgNm6d8TrhgaN1GCR
 Hbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2xFVuROxNGl2R58KGrGcsuJMKdYi5j7/8QSOffrK1rE=;
 b=EO3NKQDLWtb5fex4UpZ9rWp3SGMzZGe7vRqH+sWj+btk7hRgECyVIA+eHcps6OygYb
 p9WVqvKwUzimlyRpVbIIyWOj2Y6bCPzMSBNLRPMlChonP1L7HcsCvJnh9r94LpPnjfSH
 UxRrsj8i/J5QvZ+bEGQVC7AtRjjhNXVOYP9HhcWfp5uS6ijzgo6zxSiK9xehpHQxJEi0
 AsDDglgCHHifQ6lYRXSJJTB3H1vz3Ob93Jm381neB75b/hq1a0RpVNUdL0D1JsyGLxmR
 LEbAk1oqN0y6eFFxASzSx3eP/Sa2ZASCkQ41PNEF0GZ7cdiNtR+nyVJBEnSFLaj++a2k
 6Nfw==
X-Gm-Message-State: APjAAAWN/27myWyX0z3mT9HW9ZaRvARsZ2lDUktmyr9cQS9RDMImEU+e
 0sJkpgCQVhcJo60IOg1PlOvbdx4BZ4cwnurlFkzZBNCI2kk=
X-Google-Smtp-Source: APXvYqz3pUV9jo6nXE4tif0Lnd7OZpwLcIxfhySbaNuwbWrdUBx204a1Km4xeu4Lsha/0YpRdKFIByWSn1/bfzelrvc=
X-Received: by 2002:aca:6084:: with SMTP id
 u126mr23797202oib.145.1555441343266; 
 Tue, 16 Apr 2019 12:02:23 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 16 Apr 2019 14:02:07 -0500
Message-ID: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
Subject: Redfish OEM commands in OpenBMC
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2019 19:02:27 -0000

Greetings,

As more and more of us are implementing Redfish within OpenBMC we are starting
to run into situations where the function we need to implement is not available
in the current Redfish schemas.

We've been joining DMTF workgroups and starting to get familiar with the process
but, if OpenBMC upstreaming is considered slow, it's looking like upstreaming
to the DMTF could be even slower.

So my question is, are we taking a no OEM policy within OpenBMC? Or are we going
to take a more flexible approach. Similar to openbmc/linux, as long as you're
working upstream with the DMTF on your changes, OEM would be acceptable?

From what I've seen so far, it looks like a lot of companies have gone the OEM
route initially. They then use that experience to guide the discussion with the
DMTF workgroups.

There could be some gray areas. For example, I want to add a Priority
property to the UpdateService [1]. Maybe this would be ok to carry as an OEM
for a bit? Adriana wants to propose a whole new backup and restore design [2].
Maybe that needs a bit more traction upstream to ensure it's going in the right
direction for something DMTF would approve first? If we start limiting ourselves
as a community on what DMTF has approved, I think we're going to struggle to
deliver certain new functions.

Andrew

[1] https://github.com/DMTF/Redfish/issues/3357 (can only see with DMTF access)
[2] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/18163
