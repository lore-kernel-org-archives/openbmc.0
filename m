Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqcBb0kHTzDrPb
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 02:33:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=DOaK76Jr; 
 dkim-atps=neutral
Received: by mail-io0-x234.google.com with SMTP id j37so19112558ioo.3
 for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2016 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=MwdiB4+7jNzaubUImQdRfXqRBAn4+LNQVAZw3yxT9Pc=;
 b=DOaK76JrjSI6SqRW150jrzmMoEZXALBFpYYNeyhzOKtOCD+KPooRd2vG4heEqIz0UA
 LnnbdBWXkPnAenNdiJI2L1kT+zeGRRT5PYmp8zLI624lAqsyw+cY+m6ZgGEXvfx8IUXG
 bIxaTTik09M4PjezvnLaUr2B/Rj14aYlgkCAazKqIfrcyMYOZ44E39FuhGm5vrGRbDXO
 QrbpdgMn8Uy1o4UWTR401PSCDLfuIpdjLngX4SUou8GFmI0NT2H9bg4Ysqmh7eoE7Q1y
 /PLOjz1Pmve7GmNwglANAKTXzf9+W+NYw/QfQYpy0EyADwWtE1yiR1gGF3xuQyVtTdUm
 eb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MwdiB4+7jNzaubUImQdRfXqRBAn4+LNQVAZw3yxT9Pc=;
 b=gIxHTAJ+UDwB4J85gfHM4Tp9908zjQbfLvM+E2rSu7Ppe8N5JRrQ4lu32Z/4h5bucZ
 hjDvMrLaB0TduJCupRL3dZknJrW9VVIys33/o+9sprd4nY7AM51lPO7eRyrt7s1BsoF6
 TWd9FKu1oHjPI6wFZqnEvSVC2QpSS4Zaa4Vc+Sl+djYJfHD0fWTzG4OMyCjajxUUbb9k
 PfHhbHk+DrQ3uyPpaqD4PZZbptL0gW4wqGiFTgWatN0/WcpKpbCOWpekv9SJ+XbMS+PJ
 5oEaSUz07zJmRe+H3fFBLJd5yRCSjsUUCaLaAqCFv78v/FIRAQrnPin/8nO/QWdhUlU+
 tayw==
X-Gm-Message-State: AA6/9Rnciv2DXRHUHhe1+GgnzTIx+sOOT0cg/foP2b3/shRE08vk4FFaZ3j4hi2AYnwfR2aNF03fYppsGeSGCA==
X-Received: by 10.107.7.135 with SMTP id g7mr15878192ioi.15.1475768036556;
 Thu, 06 Oct 2016 08:33:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.148.194 with HTTP; Thu, 6 Oct 2016 08:33:56 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 6 Oct 2016 10:33:56 -0500
Message-ID: <CALLMt=q+QdROYMq5i2+xTBtgyfBn0UW8xStRjZEntnc+CL-ivg@mail.gmail.com>
Subject: Adding firestone, garrison, and witherspoon to the CI job?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 06 Oct 2016 15:34:00 -0000

We've had a few recent regressions in building of firestone and
garrison.  Any time or space concerns with adding these plus
witherspoon to the gerrit CI job
(https://openpower.xyz/job/openbmc-build-gerrit-trigger-multi/)?

Andrew
