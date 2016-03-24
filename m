Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVrfd49grzDq5s
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2016 13:56:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=kMkjc+I5; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=dkqnh5sW; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id f188so3276974oig.1
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 19:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uYvsLNOfc1M6kp3Papkhe0TSSHr+ukdvRqhmVohS8SM=;
 b=kMkjc+I5oWtTqSE0bu0T0zd7ci9eqJnAQZkMh3q5O2yi3JRFAPTo1mp3nQzMtqxtVj
 Ad00uEZWa424fPDQUvgA6brxVegnoziMuzGbah41nAdLL27ZUsnhi/BGM35rFMsnodGZ
 amJ46qeJanR0YwI5IWNBdnuo9/PiTS+Akn15h0br0KoSK+PScg1tkBI5stZ1tFoEOjr/
 ZtkSA14KQIvAW/sLx+qAGd8eXhBAnZXReJpX0jI0/DJnp1eUF157kS3ymA1H5tjM61iw
 tg/UNkcGwqv5unM2Lp9b+6VaIwu4jFTeQXgg4HIv6qXsMMmCAX2zjnuZg7MNIfLUcdZL
 V8NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uYvsLNOfc1M6kp3Papkhe0TSSHr+ukdvRqhmVohS8SM=;
 b=dkqnh5sWxq5i3W9b6FPfoWQ2rjEMoDFlWQG1uPWPVyChsOjVP+XoNlXrnK1lSeM8rE
 7KlfIQyos4rklP4Emv/Y4D0epZTO+Ur8h5ZLLtaJ9FX2ArVOVk/H0y+ATrDGHu7QiR2y
 64RLF9UOepFDx1JvPWrcX+g3kmjJPfG1gFOwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=uYvsLNOfc1M6kp3Papkhe0TSSHr+ukdvRqhmVohS8SM=;
 b=m77QaDwdhcRuVACDibd/T+ZKFKJE1YuPPh0xNHEn7AYt0DrqunBpxy1xnS7LdtHh6o
 QZsFaSWImfI4B1cRUPV1tsBtcPRGulBIyi1Br3w19hLSpqSUGi0bgiHkOsZuTfECKIUk
 A09hiuzkfNThWzyuSH52tIMM/l1mWuDJLyVn1iKQ25HuWbuJ9Vq+cyzYHhcP/N2hsyz5
 Hi9AoPRi+kWEOIuVWxFPAWEWOySCTWsP9ceORHLoJNyPw0r7X7FJQvm6Hmyp+9iT2gqo
 aA2iHFPQ7fDqF7pS0ea9McOSB4wTpARyggpNrBsQ2SOmYl6gLqYh35xjuYSiDbxnJPKF
 zBTQ==
X-Gm-Message-State: AD7BkJIM5mCdKRodLuVpHGprxz3bRmlpdUU3N+B4pdYruSpj5U1FywnVXXikkyhRZNDEvo/5A0KCRD8R1ZlNBw==
X-Received: by 10.202.217.136 with SMTP id q130mr3132763oig.127.1458788165167; 
 Wed, 23 Mar 2016 19:56:05 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.246.10 with HTTP; Wed, 23 Mar 2016 19:55:45 -0700 (PDT)
In-Reply-To: <1458720215-25302-6-git-send-email-andrew@aj.id.au>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
 <1458720215-25302-6-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 24 Mar 2016 13:25:45 +1030
X-Google-Sender-Auth: lu4UWXtNxCgFaxGljSIKdcVIayU
Message-ID: <CACPK8XfLjcqK+QVkiPAKreOWYSC2Mwczsq+8KkizK8PRoRs8tw@mail.gmail.com>
Subject: Re: [RFC PATCH openbmc v3 5/8] linux-obmc: Add a devicetree for QEMU
 palmetto-bmc machine
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2016 02:56:10 -0000

On Wed, Mar 23, 2016 at 6:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The patch adds a separate devicetree file specifically for QEMU,
> integrating the Cadence GEM device which is configured with the MMIO
> base and IRQ for what would be MAC2.

How about we put this in the kernel tree instead?

Cheers,

Joel
