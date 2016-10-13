Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sw6wT39XFzDt1m
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 10:52:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=fQtC5X33; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id 130so1870292vkg.2
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 16:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5lDEC2vu4P8as+W3Z2HqBQyMYKDDn/Xi/LMFtwgar/4=;
 b=fQtC5X33iR3RHlnaxool8lGo15BY6jfEDltvskXHi4nsD7QhcsQhBS3/lKNTHStO9v
 SoUnLJ+3It/g7yYpcNOIx54kVa10/Y8YmpaoZHx8EFM74lULjWnaDwy+EZw+g880zRzl
 JlIl5T38F+TMqveZY/4PcM6AOWCPiNbsBdJ7PbRDE6gWqWs+9VqOwUXaNl05TFoup/Cm
 XTKC5OBPISzEj0WVtbbCqMTYr0vAvF6DcARtvIwS57JGYRjGecdvOI56fL2VKLMoaoP6
 WZJFnbV+CK8EhWsBiHyJ1oM2Qr3mHmPfRh0kW/GX7TEGfCbx3m9XznyI26E2MpKdkkAI
 u+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5lDEC2vu4P8as+W3Z2HqBQyMYKDDn/Xi/LMFtwgar/4=;
 b=DHyEegkJV/yQUAPh6aIpvfRA9BUaJbO5Ej+tqNXTQrBFWowAOUA+gHnfbqErqaw9jj
 lpFq9TnGPeu+gL6wPNvY4yl3EFP9ocxhWwASaYcBPq+tkeHad0Pvy5o1qVBgQMZ+1ZKb
 nFpuJbXxXmjHm2AOn2WTJDl71esg82qcTMNKRKM20u5mB4iXpGgMfksbSfejfCp8Uwmx
 ucsIhKqekoWCcNpX3UwFHgjGl+d9zYEUTPq3teiXFMvhSK9OGjvMKydoiPdh0iWrWL1e
 F/XVDvGN6lmEuIKej3Svn+RCf1mDk/b43W0UA+HWMD19LUUxPi9lo1uJqvDaRVxycnJS
 bJmg==
X-Gm-Message-State: AA6/9RneanF7ams+Pq8HxYD/vfgvqEiquiPMvQQyx++BP8IWlqYJFT0c6YHJXI08ZxDLj34nudb2jZttvlv/8w==
X-Received: by 10.31.233.6 with SMTP id g6mr6816982vkh.148.1476402743119; Thu,
 13 Oct 2016 16:52:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Thu, 13 Oct 2016 16:52:02 -0700 (PDT)
In-Reply-To: <1476394905-16847-1-git-send-email-eajames.ibm@gmail.com>
References: <1476394905-16847-1-git-send-email-eajames.ibm@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 14 Oct 2016 10:52:02 +1100
X-Google-Sender-Auth: OLy_7wSx-2OQ0bp-Lr7MBtIfb4E
Message-ID: <CACPK8XeQEJ8KjH=PgNocui8RmS2b9M9DxwujwzS4PnpGjfJemA@mail.gmail.com>
Subject: Re: [RFC linux v4 1/6] Revert "hwmon: Add Power8 OCC hwmon driver"
To: eajames.ibm@gmail.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 23:52:26 -0000

On Fri, Oct 14, 2016 at 8:41 AM,  <eajames.ibm@gmail.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This reverts commit 7cddcb99cb42cc4a1d72f2d73a78394bb2dcb0f1.

Cool. This is the right idea.

However, you don't need to send us his patch when posting the series.

Cheers,

Joel
