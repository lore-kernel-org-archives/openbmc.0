Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::236; helo=mail-oi0-x236.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ueHt6csk"; 
 dkim-atps=neutral
Received: from mail-oi0-x236.google.com (mail-oi0-x236.google.com
 [IPv6:2607:f8b0:4003:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QD0q431fzDr0d
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 06:13:31 +1000 (AEST)
Received: by mail-oi0-x236.google.com with SMTP id s198-v6so45065367oih.11
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 13:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yr9Scm4jjYtw6V6N3CXrV3j95rr1gGoyJy7ZlHtTsz4=;
 b=ueHt6cskrQXGjX/tr3fPW0BYZ0XxsffeLCMNsYONRS9VzicEB72Krisr0FeY+oiNgn
 ET07Jb5uRbmjZEoEwsZhwA/2jygFHvXleCE1k9QbLGCxhfaBgtjDcanqAFiaoYH70Yl2
 Uq2RRk3izoDsQ/CpvLf2IPscB0YlCu3PPUv3qL2efKOqssAgHNJfoGQqOSs8vEAzRJLO
 er0ZZGxKFhG3c5ePt5lWAuEWTqpdKWRqaTkxdDBYC+tRVsAeDg4fn8/k3Tvhb7DI3o5G
 m39Pryyit+/WmN6A3jBeahULV3hX8CQYctLaKuM5+jTSDWCbmVOQEII8Ux7HQChd6FPw
 9dkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yr9Scm4jjYtw6V6N3CXrV3j95rr1gGoyJy7ZlHtTsz4=;
 b=dXfbmKiyx/TsI8j4iIod+R0fP4H91aum1clalHoWhi2mQddlvT0cllGWFUCEfFjNH0
 9rSmzleO5HgpHuWZ8Lxz2fe9bfyfnxtRyXyyc/cIeuBc/5P78YHBUWShamlmk5h8Welp
 n8MsZ0kCh6Q3FCZ+ULM8BASp8Rxi1YIYJYk2rqa0ff8yVFQZOXGZH5gY2ZMnmkL1aZ7Y
 r8GxTminsEGkvkQOqMg8IasGwzOLFbs/e3yAS0TEVXVQdBIHB+L7sGdRjGErLRmTjy3q
 ljh7YoskFn0zDEUwAEIR3tbxmyHqciUClDCwVMHsRjNGwNsFXdK6E8nEALgOMOM0v0++
 x1/w==
X-Gm-Message-State: APt69E1VQl+zMilX9/9PKbVwfXIhD0VVBEVdSBU/X6FlFXnA1PeGbNaP
 cypJwQHiHZVou/IXo04P0SSMrRT7kSs5v3kvaMs=
X-Google-Smtp-Source: AAOMgpd4KkDw21S6O5FKLQut5N04TNc9fwnGjQZRi2NLvtZn87V3jaNevE76F8H412Nwd0WlE0GF9nxixuHc9+JmOBg=
X-Received: by 2002:aca:b909:: with SMTP id
 j9-v6mr18128584oif.257.1531253609176; 
 Tue, 10 Jul 2018 13:13:29 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 10 Jul 2018 15:13:18 -0500
Message-ID: <CALLMt=o8yNPgjuvC_gDhqVR5TrrdA5pszi+vMmAmATGmZC1w6Q@mail.gmail.com>
Subject: gerrit server update coming - 2.15.2
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2018 20:13:32 -0000

I'm planning a gerrit update in the near future (this Saturday
maybe?).  Anyone have any issues with an update (or know of any issues
with the 2.15 release)?

Andrew
