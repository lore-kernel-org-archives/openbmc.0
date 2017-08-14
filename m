Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW2kk5qx7zDqhM
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 14:31:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MTbb5Dj8"; 
 dkim-atps=neutral
Received: by mail-lf0-x242.google.com with SMTP id w199so5826939lff.2
 for <openbmc@lists.ozlabs.org>; Sun, 13 Aug 2017 21:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=LO7+zsCEYchRyWRE6E+kD3p/cPQEGmrURj5x7GtIXvM=;
 b=MTbb5Dj89XEccOpXfd4k7YkXyr8WiJjeSHMqH9S57o93xec6yz8v/GjuiHda2FwbNG
 QYFxZNDoS19hm+jMQ+l26Asr+LfSKf8CSHPz7CzQ2ngJQBE+Ayfo2mDq+QRLdG+Q8/GB
 qC3vnw9wR53TwtR9q/mZJX2nMHSPMLyW2OH6FFGLqEC/6WJ12/8rpon1UVYgqzRnKRar
 I6J8zoO68Tl9PSGJCy4YTlNBMWpE8nK7MpW+Rp5+OyAjE3g3dQgV+EhcxJzJ3/UA13VM
 YK+LoUw9eZ62Mewj2SpzSovKjKiACR5EjaZMBG6JGMhSWqITueTFTxNm7hBeZqqlyyJF
 Nybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=LO7+zsCEYchRyWRE6E+kD3p/cPQEGmrURj5x7GtIXvM=;
 b=lxZNyXdvA34R+SkmQ2QT1p+FebgfTjFqHslFOUAprArJGq+ICRXlpU6BD8svvYIAeR
 vmARDAYdvaZJU5lXjnZQrFSa8VPR14TkZYLoDq4J+xM+LoQHvCYEmiV+2OdhBNmhaH1H
 cDbTMEeQvOyP+9Jfmz3CsylIcUOCU4c2Z4yRs+o6MGNPiaoVOQylvRb1OG/BwB8oqwEb
 KN6IdRqNkeniGYL7ObHEKMf0CJtQ1CFN1llDqnCBHlLpmDujOJoMCsBMU2EyFnnkTj1y
 tm3RyxQ5lTEpqyP+NeR17PnhkztJLLZfFJD/sLAkC9XlSjabBqOEuInQ5Z166IpSuDce
 q/LA==
X-Gm-Message-State: AHYfb5ju+7ooTqpLuset3ReOS0H5KiusAR7P4ActYsFe1t0j3xB9EdgG
 3YCZFMXWIHKC990c4dL9gwJJBmZD0g==
X-Received: by 10.46.69.87 with SMTP id s84mr8485571lja.129.1502685115385;
 Sun, 13 Aug 2017 21:31:55 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Sun, 13 Aug 2017 21:31:34 -0700 (PDT)
In-Reply-To: <1502474608-2674-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474608-2674-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502474608-2674-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Aug 2017 14:01:34 +0930
X-Google-Sender-Auth: Ib24aG7iZKl83d2k6sQfDmXzgcc
Message-ID: <CACPK8XfVLJ4J8J_ebTOjhJNbQnTZcwt2_yAWzexrttza4P4iQQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 1/4] hwmon: (pmbus): Switch status
 registers to 16 bit
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 14 Aug 2017 04:32:00 -0000

On Sat, Aug 12, 2017 at 3:33 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Switch the storage of status registers to 16 bit values. This allows us
> to store all the bits of STATUS_WORD.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

I have merged the upstream commit
(a66a6eb9db10bd630bacf31e33505302c8e8303c) into dev-4.10.

Cheers,

Joel
