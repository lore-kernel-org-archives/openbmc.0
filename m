Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgPlH57ppzDsmC
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 17:15:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=T2NN3LOg; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 107so1076970uah.2
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 00:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=95EBd8U52rYm+I9Opv7s7H6GzLCsZPo8W5n3zDLOurA=;
 b=T2NN3LOg+IoNBkI+Fn7gDqc1jvjXMiRLZpQz1PRp4hX0lyxdaG6icyQxbZMb7r7pez
 H7+o1jb5Nr7V/hviR++p9txHSWr4q9BeNWHV37kZD6qdAb4cEuPkGDAh5a2OS/6VJVp2
 oeWNCuM2bqzldamKurJl0Y5k9FrOGZeCp/upeapMG0YrzSkA2tHhbr4BH7fhGX7+6SkY
 lG9ZF95FCnOxra9Q+lJdyXBfUk5HI7Dt8oF24+34q+v4vg1OAVwnd8012HuSKruU1H7c
 GniR41xGPC3Kl6OKHEaq/nI8o7VrXyc+5umk0LqppHymMR04QN2Lp9YZAqiUVgFc+GX3
 wctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=95EBd8U52rYm+I9Opv7s7H6GzLCsZPo8W5n3zDLOurA=;
 b=RGri/mtKzEt9M1TQ7o7VJsux/uad0Wnhweci72xh0K8rb79gbStqJ95euN835B7wM6
 1gSQNTNPy8QUSF4gXLnZKzqtDjR1Wp/SQE5sjxKbei7uKlbKYEyp58KO9cyvzxSlC3/W
 ScIgfdAGgk/96+nc2fmhRSg+Y6rADS3koxIhSvfPNwKjY51yD+U8UYhNPO3YWLjWm2yS
 KzDt7mrd/KD2shmpzoWeOGeePUnEPnJTyinwO8N8bVQ/7XbQPdnhWssNQN+1tlP1iHDl
 x+dz0YVT/qSYhrXFTERq9gGyuDpJWCiOgZCP/UlJY4UFD5BgQP7O70t07+wvbRK0hXWz
 XCPw==
X-Gm-Message-State: AA6/9RmAvsXnkyNEeruCsDt73L+3eC2KRvzXe6FqeQVz1nVEO/RMPXyb8E145Qg0ggMrSEd2sK/+u68yyR05eQ==
X-Received: by 10.159.38.79 with SMTP id 73mr2687809uag.7.1474614921603; Fri,
 23 Sep 2016 00:15:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Fri, 23 Sep 2016 00:15:01 -0700 (PDT)
In-Reply-To: <1474058133-27363-11-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-11-git-send-email-tpearson@raptorengineering.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 16:45:01 +0930
X-Google-Sender-Auth: 28fxRkOsJR2Eg5LbahJmqykaE5Y
Message-ID: <CACPK8XeDEDeEmtOxL+BZ_zgsqtxLSwpcSp1aoF_kEtLMsG=vnA@mail.gmail.com>
Subject: Re: [PATCH 10/17] Add missing console UART to Firestone DT
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 23 Sep 2016 07:15:24 -0000

On Sat, Sep 17, 2016 at 6:05 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> This is required for the BMC serial console to function.
>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

Applied to dev-4.7 as 7b57dfe39d113a776a359226cf7a173d55cd6966.

Cheers,

Joel
