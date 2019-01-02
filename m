Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O3NuIMOV"; 
 dkim-atps=neutral
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VKFn1XRNzDqHn
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jan 2019 05:24:28 +1100 (AEDT)
Received: by mail-vk1-xa33.google.com with SMTP id 197so6761810vkf.4
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jan 2019 10:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=t+wiqriavqVnRJBtwTmuzIrEd6GJyMZUYOQhnW2JGts=;
 b=O3NuIMOVZgPl69lQO0zOGk8Y0YtEmIao1x63YfsaiJrjaMjQdR4oebZkUxL3Lly/G8
 Z8FvIDz4lTzb3g7NLmjBdj5HCohV+c9/fz6jU5mz2OGT0aDCLRlxVjpI6b3D9tfOxZ1x
 u0jQONB0B8JINRagjTWqVTFPgnOHo4zAuJH6g9SG2VDpLPBDjvhrE+h01S50TFQPEkFj
 Ey4cYpzHs8JOrD5926M39vZcsK3eG1YcxlD9IBoU102aEGE+sFSJElbmgosEkpg4i86J
 6rtXTuMhyfUK8I3Qjaug5DRBX7WJll7qb+MnxhIL9olh7nLyZTbRyQXRBdKHaFTQJUco
 pHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=t+wiqriavqVnRJBtwTmuzIrEd6GJyMZUYOQhnW2JGts=;
 b=VdkBTW28bknGuZEy0x0YdjujzGtfrlElD17xM7k0r6ceQqL2QbAOd4q1en1PbWFbu4
 m51yvMAvVT659j7ACJ/Wl9kgl6Co/FMgGJUm6gkty1Bq8I9tmvnnfmLMvxfOWGvADV9S
 DT4kRw03Cy52opfOTh9Erh4LTVubIdFZpU/vT4cnVxtZJrA/EpTQmckuIp9XgSO2TqKU
 h+LuMWxYP9DVf4YxlNrggxzzobtMgRaOenFpuc7d2VbM+8AurTsC5asGe6HSHMLnNowY
 gS5yEUYFc8v3PZ6HMRJeh5ipPyo8qxm3nGWBcM9pjhIgw1Q5IGO5qdbXM8GMz/AbMg2r
 LGNQ==
X-Gm-Message-State: AJcUukcwMT3jF0vsm/0zUCAcRbKljLBBhHTTjDZipWdcN7rLcixe5fCt
 V0ljoogGwXDpZSueMzhFyqF6zVp7lD8NlejO14jYrR9L
X-Google-Smtp-Source: ALg8bN4Z987AXDmRJgDplQmVUP6ZHtuLv7ha7W+1cmj3CT/ag4aEAswm7+9NyIgYC0zgkBuGzL1ptBmMAaCKre/E8PI=
X-Received: by 2002:a1f:60c9:: with SMTP id u192mr14968781vkb.36.1546453466084; 
 Wed, 02 Jan 2019 10:24:26 -0800 (PST)
MIME-Version: 1.0
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Wed, 2 Jan 2019 12:24:14 -0600
Message-ID: <CAG5OiwjiYZrC1ShDHOJktnKjBRydwedEsagLGcnKeFeLMZjRyQ@mail.gmail.com>
Subject: Heads up: 2.6 release freeze next week!
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
X-List-Received-Date: Wed, 02 Jan 2019 18:24:30 -0000

Happy New Year everyone!

Just a reminder, next Monday, January 7, 2019, we will tag a 2.6
release candidate for our first release as a community.

As we agreed in the release planning working group, we will have a
short 3-day window of sanity testing and then branch. You need to be
planning on testing the tag during this time to make sure everything
looks good on your platform. Unless there are serious problems
(unlikely), we will branch the release so that master can continue
merging patches.

The remainder of the 4-week release window, until February 4, 2019,
will be set aside for companies to test. This time should also be
spent making the documentation current and complete. Patches against
this pre-release branch will be accepted only if they have minimal
impact, such as documentation, or they are critical to basic
functionality. At the release date, it will be tagged 2.6 and go into
maintenance mode and very few patches will be allowed to be
back-ported.

Please contact your release planning working group representative for
questions, or contact me directly. If your question is general in
nature, find me on IRC or ask here on the list so everyone may
benefit.

Thanks for all the hard work you have put into this release!
Kurt Taylor (krtaylor)
