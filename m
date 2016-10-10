Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqpd4sb5zDsgg
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:24:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=YJrr0Yc0; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id z126so3741071vkd.0
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ky/c3+v6Q59MW1ZBRLi6CJktVz4nE2o6+qOIoFr3heo=;
 b=YJrr0Yc09cqSQ9dTJgQyzL2fv1wD1FUuyWOAGvcjHI8lEvLdWqoSIgkc9uzY4VxPGz
 WoG51Op8x4ssdpuqDX18aXargRfYrH/3E8xSb5g30YtSBeMbu7p2O16AvJPTlG4lve1f
 uhmF1imhEgItgiR2GnG7GPm2ApOr22gWLiuKMVXqz/2Eh767D2qT6RJBIWL4VNCCdpNS
 EU6rzAN0l47TfAZwUVVwclZcdt4MZiFX1OXJFatLApu1/Q77ZgyJ2HG3PGqYpD+NDQYr
 Sh68bal4KtsEUL7rcloKrm0riuNgNRAsdfgZ2GyV8mBXNdBc5GOVnDltWJ7arcrhlXwC
 Vyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ky/c3+v6Q59MW1ZBRLi6CJktVz4nE2o6+qOIoFr3heo=;
 b=a6/dGieVejdCtCX2N1nIkiG5CqwvkEa3ZUbfRctmsay62YH1I+56Ed8rTup9QW7OTV
 G9sO3XfrkraNiPB+mJ1VYOh3kkkOAc1omz/godtenpr0QqghIneMW/BjVvoO0kTnVJug
 atsJV920s6N1aLf0tOV5eYSrf+INhmqdHNL6q3K7wUvwgycNiGgodHiXWOZnV+D3hCey
 LwjqafyU6DbSA9Z7OoILAcsQaVLeBorp+1i/PFfodjxKONuvn4u+TntbFU+zdUGVBLt7
 Z7qnKU9UGwAxjRgx4FG0+y1Zo1EY+29A+E4bMNU10z6mMAoTW5pTXg+EWPv7+T7rkoUE
 kmyg==
X-Gm-Message-State: AA6/9Rl/LkncpokueL6M/F/WEEqbeb7NsousKJTiJUX/w8EtHz7FOthWs8Vfx7LbQpjXi/CQ5i2Wta5qStCVYQ==
X-Received: by 10.31.102.6 with SMTP id a6mr6420134vkc.151.1476080663820; Sun,
 09 Oct 2016 23:24:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:24:03 -0700 (PDT)
In-Reply-To: <1475789205-19618-13-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-13-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:24:03 +1100
X-Google-Sender-Auth: qnh3kqLkHD9xO1flBI4sGwXOFE4
Message-ID: <CACPK8XdR5nFwpZUbwXMiBmyfJnALQAdkejb3a16bSsrJv+MbMg@mail.gmail.com>
Subject: Re: [PATCH u-boot 12/12] aspeed: remove hack loading ramdisk in memory
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 10 Oct 2016 06:24:26 -0000

On Fri, Oct 7, 2016 at 8:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  common/image.c | 11 -----------
>  1 file changed, 11 deletions(-)
