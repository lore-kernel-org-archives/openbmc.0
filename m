Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="a1l05sFf"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42hVw12rgLzF3H7
 for <openbmc@lists.ozlabs.org>; Sat, 27 Oct 2018 04:14:08 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id l81-v6so867054pfg.3
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 10:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kv2ERyUbbGTkYpJ6ZsoheFrY+HHWrDPVL+AD6tcooJ0=;
 b=a1l05sFf1QRfCTIJ6FOVkD7ryGqYqTLZXXwmN2b+V73pZFNxpJX2hatVMk1uj52LSR
 wUsnvVlMcjAE8OsSotZ34eA6C9bhcJhATphE/0ZmbEahZj/dE/BwQJEQ9xjAf0PGjypD
 ZaPt2pvUTrTczIvwF+F0JmBUXBprLJzdSBaDb3mIOajhyk7j292IlBCdhL9bZGd+ZYf6
 sCG0xxVybtKacfQ2F44zbvurEBFxiaw6llk09wr77bl0Ry0KXaQIv9RQFXQbsbpY9WAi
 EamifhyfGUlQDZtGgWY5BAoWBc7bRLYPX0fVTZ2VfdKr7uQIeXrw3sxCPp+UAKnOeZDk
 1Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kv2ERyUbbGTkYpJ6ZsoheFrY+HHWrDPVL+AD6tcooJ0=;
 b=bUYHFbE3aEuhfVVNj6jYg/i2VuzLXkw92r+Y7uoia8Bu3PoFts3hasOA6M+ZrrASYt
 ITYeFf/XEvRsgu2gCPS/wiBGs2WnikWCvzIs8RotssGHgBeEQVzBcOj4zUg2KLtCFWRL
 FjAER4ytSxrCSLus/I1oJYWKVoQoEtFnGqwTIS5yYr0BpYGmoOgSuihjzwXVTIHQ9oUP
 nAeV1lwd4use1eZiLI8XO03s/qI8ss6N99wOrDgBAhBGFMi1YCdHgDly32O+U/KQZPtc
 WZW7NCGTUi2wPk/+n4nlV4HUP1dIh8v4W1xiAy/szs9joruQc3qiqIDky80pS72/K7+l
 Q4xg==
X-Gm-Message-State: AGRZ1gIhRaRPtPPFL++vedu2v4bueDssAiOh2mRXxdI8r7vsnMlSej8K
 zGBOBudGB+Bw94Bx4qVX4y6IcJWDqPgFemoGAHll65+SwO1a2w==
X-Google-Smtp-Source: AJdET5fDQH/gsHICwHHsW8DErOGlepzN08MqyjYLD6r2eN5OGqnJCiSX35gp0oFXlqxt1VHbkUYpgoeDwJjf5Tmt+Nw=
X-Received: by 2002:a63:fc49:: with SMTP id r9mr4173363pgk.209.1540574046078; 
 Fri, 26 Oct 2018 10:14:06 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 26 Oct 2018 10:13:54 -0700
Message-ID: <CAO=notx84Tdf4VPZ1pBHpDtvjmUgtDDVqYJRKpkJLyCpNQD35A@mail.gmail.com>
Subject: The Great Recipe Rename of 2018
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Fri, 26 Oct 2018 17:14:10 -0000

The great recipe rename of 2018 is nearly at an end.  If you're a
downstream maintainer like myself, when you rebase onto this you'll
have quite a few local items to fix.  For any recipe that is bbappend
on a git recipe, you can use the version wildcard approach to solve
the mismatch "recipe_%.bbappend"

At this point, I haven't touched a few recipes:
meta-openpower/recipes-bsp/pdbg/pdbg_1.0.bb <-- versioned, so ok.
meta-phosphor/recipes-devtools/iotools/iotools_1.6.bb <-- versioned, so ok.

And I haven't yet addressed a recipe inclusing the skiboot.inc for its
source***I may still do this.

Patrick
