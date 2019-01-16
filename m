Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::136; helo=mail-it1-x136.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ogH8DVMy"; 
 dkim-atps=neutral
Received: from mail-it1-x136.google.com (mail-it1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fWcW09qBzDqNb
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 13:39:06 +1100 (AEDT)
Received: by mail-it1-x136.google.com with SMTP id a6so753925itl.4
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 18:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hk52iG6gnrtykt5e+LwxTWVtXrmq7EHNNTcZC1DFaLY=;
 b=ogH8DVMyIwRVRF62TBFytk6P2eniduhEw7z5imjfHUYqsPz4tcIlqMGpIWdjzDcwjU
 R2hD74OOF3E6nIw2TmvEGEmJtlme9Tk9K3x5ArfjnMwzMTy6krNaN5GlWaH/f2i9z5Xg
 ckRTPCfFFKA7llFLKZu3dWVGQUTE9M7jqsd4RPc1ECCPmgvSfKC/MqoDQuAAzwutHa9g
 xihHpdtkR0p4o7Sh8Pr804tomHXDnaO/V+tOiAu4ZqYeBSjzHxGMp0aJ8x4AFvu3tYz/
 vW/SG5h1WKflTA/qb+Q+IhUZXx2iIkWMR5uL6twmBfjNHfp7+5s+CsV641EDT35/RIJP
 Ow7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hk52iG6gnrtykt5e+LwxTWVtXrmq7EHNNTcZC1DFaLY=;
 b=l5GYKGX70851bkNXCTrReea0aQpCDAk/6V3TnnwpqD6IFAd1GvryW10xItitxbn/Rm
 7RQI87hF+jn8x+kR1hs8kTyICaMzlm6Oh4sr/rEuyfteIP0SDuZ/AV7grj61CgeJfbMH
 ePwAfJZUHniCnd6rrrDOVRuBe5obB1smpW5sBM50w5QfWivQTUiCZxKlvYMiAAZzhHYS
 7PghcyjCXSNCDHuxkuYglsW2siQrI2EJLOrjdPfp/OADNluqoEzw7izin1TjqCW/7eNP
 7vAXd7KAFr5m+KE+BbxT3a3HfRNCtV2vkY9ep3mwzncsW544HkXHbuLJwONdrqRXjFcY
 8OKA==
X-Gm-Message-State: AJcUukcbJUAQtzdAcec1tqj8+nJrWGFzz31iGvJDxr4JXS8p2j1rajMB
 P3oQFftTbsplDWnEJcZ0VQUta75VY4Wd9kxL2cM=
X-Google-Smtp-Source: ALg8bN41E/hHNSsA02B3wLREK7uqH8cRizo+8NHjCHqdTgvW+JPCVp/C7LnRk9dA/lzcsgLFdfZOnweJgvuC/u5WkuY=
X-Received: by 2002:a24:4ac3:: with SMTP id k186mr3743070itb.76.1547606344291; 
 Tue, 15 Jan 2019 18:39:04 -0800 (PST)
MIME-Version: 1.0
References: <CAH3qHnYAVEVVgQZHaezCS6v=gUGGwUF7bsch700T-OzYv_0NUQ@mail.gmail.com>
In-Reply-To: <CAH3qHnYAVEVVgQZHaezCS6v=gUGGwUF7bsch700T-OzYv_0NUQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 16 Jan 2019 10:38:48 +0800
Message-ID: <CAARXrtk5YaL1nHmYEh06sppW65_2BRseQvWASCWNPtdv6NqVCA@mail.gmail.com>
Subject: Re: OpenBMC Globalization
To: Ryan Arnell <ryanarnellibm@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 16 Jan 2019 02:39:07 -0000

>
> Detailed examples with screenshots can be found in the slides.
> https://drive.google.com/file/d/15xG-v0jY7VKTFE-KRBFtmnxyjrUHa6IT/view?usp=sharing

I would like to point out an error in the slides, that in the page
"Chinese - Simplified", the page is actually showing Traditional Chinese
texts.
