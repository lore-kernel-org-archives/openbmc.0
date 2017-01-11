Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzNyy5JzBzDqJ5
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 09:36:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SztHxln8"; 
 dkim-atps=neutral
Received: by mail-io0-x232.google.com with SMTP id l66so5033765ioi.1
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 14:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9/TX/zJsBq37OK2OkXQYeA3y87RhbGSNSuhzjrSZaac=;
 b=SztHxln8CxkLWxCi2vzUSrh1R+KF8tRpZIasNm5O/nXU61b6jkA9RGqXIBLeN0Z+AI
 nSVXk3uUD6GLIcAPQNLmgbKofpnPb53X7wKx8sadgDAXPS5oTYletWRJK5kZwZPzoE+d
 TTo/wLoRhHiv9l5OqNsQl1ZcSSwIKRmKCOHbEBMy4CBGfhsullnvCn+mUrUmKd1CZY5n
 d6jlOEXxsl0wjsrqBBEiv4oCpTC4Ayn6d7nhbrxo8KeJ9Jo/6KivT01XVNyaONb2y20D
 BRHHP7lg4iMxqbbuAnhRZUqA67rwriwRZgcS9udzOohEGQPSD/CkR9sfl4J0UCHmyL05
 XnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9/TX/zJsBq37OK2OkXQYeA3y87RhbGSNSuhzjrSZaac=;
 b=MAjEdXjDuaAK4Uxs+F8dWK0XI4Odyq2W/7QRJQfFHdMYdPoh2Fl79ETouE15NtpO5V
 6KXaVJuL0OGw4yOXI5CAz0+3HuOp5dLFxpaab83iff7i7TxZb6j4Yfxelm0C0XMaJs5R
 +5OtJh8PC5a0If73bCRMVs/667JrD8eaJ/gR/FY/qxU9oBTP6dsC7rtuIW3YhDPl/fdS
 y2eYkF4AmoLImvQtSByC4JoFSsmqjvmKj4HX+pW5uIAaPSrRN89AT529qS8A6DhHnf/p
 V+/904vKIk/Ku7/b47hchQ4xb34GTX9JIo3zmgnzMfw72S5oBxXZpBoZ9DrtsKo6QLcc
 elWg==
X-Gm-Message-State: AIkVDXKsLtnuYQWqH5YVcyA3r2ClwIgEMjyBdGuw18sH1JkvMr14VrvuHkp26qjPp27jG+FkwsYygyXBpvRgMg==
X-Received: by 10.107.166.18 with SMTP id p18mr2548664ioe.15.1484174168615;
 Wed, 11 Jan 2017 14:36:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.9.155 with HTTP; Wed, 11 Jan 2017 14:36:08 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 11 Jan 2017 16:36:08 -0600
Message-ID: <CALLMt=qDOBvCQO2T_=FS87oQ46WYnKWEE+PrCc8F6gTw9jwYmw@mail.gmail.com>
Subject: New per-repo CI job
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
X-List-Received-Date: Wed, 11 Jan 2017 22:36:11 -0000

Matt Barth and I enabled
https://openpower.xyz/job/openbmc-repository-ci/ today.  This job will
eventually run against every individual repo, do a build, and do the
"make check" test.

We verified we can configure it to run against each repo but only have
it enabled against phosphor-event for now until Matt gets his final
code pieces in.

I modified the https://openpower.xyz/job/openbmc-userid-verify/ job to
do the same validation it does against openbmc/openbmc against
openbmc/phosphor-event.  Let me know if you see any issues.

Andrew
