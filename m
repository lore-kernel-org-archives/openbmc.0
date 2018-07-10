Return-Path: <benjaminfair@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c09::22f; helo=mail-wm0-x22f.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PqrkUfbK"; 
 dkim-atps=neutral
Received: from mail-wm0-x22f.google.com (mail-wm0-x22f.google.com
 [IPv6:2a00:1450:400c:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QGfw54gVzDr02
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 08:13:12 +1000 (AEST)
Received: by mail-wm0-x22f.google.com with SMTP id w16-v6so505866wmc.2
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 15:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FE2jbcFqb/ykw7JaCiWFXAXteprTrzYKzdacnD/MrN0=;
 b=PqrkUfbK5OO/QnuAoXpbXNEKhSMK6asLr6MRS59u7zQB9UqGDYhsCAZv5mKgJlP6Ty
 ApjjCOn7aPG26oNNnsN8NQ69t6x0Yv/ZjIuAmlpz55FKIHP1jCxyk1rLPCFT5bSzZoed
 QOEX6OAXVpJJP8Eh3dttEjoc4WO50pHPsDgO7ivvCfv71dqA2VsMYJxynIHfuMOWimJH
 /3+4nd6vnKM7FWFFURhQuvgohkMR2A9nAiCsd7ztyiD1JSuFFLmoNMN/ka0saoDfX3sW
 7/zeKCeCGFpU5PlrkhUfg4cW98oUe94ipfi9OLz/KVzrmdZVfKX2PUCkL8Xv4E9S20xq
 ExlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FE2jbcFqb/ykw7JaCiWFXAXteprTrzYKzdacnD/MrN0=;
 b=HgY/a5km2Gwa2qAqoTNptFtecu24EMX29wsI7vWxlguU7ANHm2xNPi/ynaceDUFzl0
 fhUezqbf+ZyaXCaqvXMOihKQv14kAicuxdv0LdMAmlfob/bxWWon2hKaM0l8mdSwoE9w
 cdALv0pjCk2osthiTxDNx3/1kZ2I+g27rgN1DiR0g8XmTKpimiywMtQNFSa+QQNAsAMI
 v0wFxH7awm2jCc8Y9/bI/30F/grmzIQ2zQJ18sJfU5BCHUdsPxEtWAwtQ/BYssY7lc8C
 CnwjRxrI0q0VoCDq4i/F9GyEk3IDuUrraJd6wAHUS123nqeji7D7KDuxqxczwabnOv4a
 FcSQ==
X-Gm-Message-State: APt69E0XDVAcBs/XHrL7Sp9YJVkC0zCVAaYqtRuuQ4jfTmoPxLx17JPp
 s6B1t1VLz9++78Z0MTg5+r7+OWEbKTJiSqPQXo8obg==
X-Google-Smtp-Source: AAOMgpeOHtbt5JxHKh0BaUxzRGi3VKGS/dsF+1Pd9SbrDVVxHk++rUxULJQj6l63QX0DFaofAu5zJn6I0RSD17b+mvA=
X-Received: by 2002:a1c:b286:: with SMTP id
 b128-v6mr14690826wmf.121.1531260787747; 
 Tue, 10 Jul 2018 15:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <CABq4n+T4aZ+iPerYDOrh8KJ09rxyUC96h-Qhvvznjz0AQuQ7Rg@mail.gmail.com>
 <CAARXrtmU-kfvyyWWbmM47AHoD5219bGnqgNTNY7O8JakvVt9XA@mail.gmail.com>
 <CABq4n+SRBLfsp+_U14DzjkaC88tHEwJAxpnw2E-UAWXnur7QSg@mail.gmail.com>
 <CABq4n+TD_L07cbhYe34zsQMgEbKY5o4+XTJuEnZ3NJFe9i6fUw@mail.gmail.com>
In-Reply-To: <CABq4n+TD_L07cbhYe34zsQMgEbKY5o4+XTJuEnZ3NJFe9i6fUw@mail.gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 10 Jul 2018 15:12:31 -0700
Message-ID: <CADKL2t6Vh7Mnxcn_k7eoJtCNjUkRgBu0Qu+mHsLopzoKqNE3oQ@mail.gmail.com>
Subject: Re: Netboot full image loading AST2400
To: aaron_ppus@fmad.com
Cc: mine260309@gmail.com, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 10 Jul 2018 22:13:14 -0000

On Thu, Jul 5, 2018 at 2:02 AM Aaron <aaron_ppus@fmad.com> wrote:
>
> What I cant work out is how to get the eth0 IP set before init runs, so hacked it into obmc-init for now.
>
> Aaron
>

You can try setting the ip=<address> kernel commandline option.

The full usage is documented here:
https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt
