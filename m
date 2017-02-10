Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKH1M3J0szDqBQ
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 12:10:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SgN+wQ+V"; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id r136so1632118vke.1
 for <openbmc@lists.ozlabs.org>; Thu, 09 Feb 2017 17:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=R8qFyUS1ySNntkNM6vKX7/QpHNiAvS+DEzpKb8GJKEY=;
 b=SgN+wQ+VkonShsqyFpgLO2gr14YAlRD2ZRAHjEtMXnC83vO9I35q2smq78k557HqGJ
 Zg3ttwgAoBVWF0OSPI2RnabTCpMBHRk2XZasnQpfm15C0LEzW6g416s/y1TLm5MGuJTO
 olIvW0uElork5iaYX1VSWPSQ+6VAVf3lQr2ZmITEijI1PM3Nc/NsjiFkimrQDlGG+as4
 XKfi9xp6wDZYwrqhcqVnYx3mMoW86cAVgS2xkcIhwPzEmGhUGJmCclzDlYTZMrZ/s8Z9
 xQgoNGS9oWDUWAuEnurgLKgO0KG6p9oQFwl1PVomN2K87rQXwH/jz0W/hZaljNJVZXWf
 HL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=R8qFyUS1ySNntkNM6vKX7/QpHNiAvS+DEzpKb8GJKEY=;
 b=Yixf8evtm/+yfEYt4zmAQJmH4S1pxUW5hrolnAP50uxesI8e3gQ9MYB4d8yL7xZBqz
 28Ttvb31yEWSsfTis53BYZed9ta+9w6Tx7mFdDa5s5HTxQugfJObfJLHMJgMKLKd/dxb
 nJCXkBSw5h3vBElqczZdIUmKTcpgV+tIba3Mwy+twcO78R6fN6qEjraLBIH/L4GROItT
 +QuqYTu291wYhuD2BgMyLt9R9zuW6aQXCeIPt/TR+/xyHzkGqckWki5mrydyvaGv+94t
 qUI8hnIyfKuddfDn+pU0aZ3zAz2VHXJR7etUj85uQ38MY2J//KS2rMTw2P+xTfwPnqHZ
 PjaQ==
X-Gm-Message-State: AMke39lxOumiso+R+vMHWN+g/1+3hw8AMRCZfx/7WqlRtkRcqhrx4eh5Gb3xhBGhhkLSOA1V66QZS246uUa3Cw==
X-Received: by 10.31.47.85 with SMTP id v82mr3099383vkv.2.1486689013153; Thu,
 09 Feb 2017 17:10:13 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Thu, 9 Feb 2017 17:09:52 -0800 (PST)
In-Reply-To: <fddca6ab-22b6-8d75-de64-c52f264676b5@linux.vnet.ibm.com>
References: <20170209201737.74109-1-cbostic@linux.vnet.ibm.com>
 <fddca6ab-22b6-8d75-de64-c52f264676b5@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Feb 2017 11:39:52 +1030
X-Google-Sender-Auth: GTOLn0aorT6p_tBZS9Xi9Bidc3I
Message-ID: <CACPK8XeBDtp+vErZxhLVOKP6dFjwVk4VLgTB2vyFha15LWKXiQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Adjust slave ID based on
 address
To: Eddie James <eajames@linux.vnet.ibm.com>,
 Alistair Popple <alistair@popple.id.au>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 10 Feb 2017 01:10:16 -0000

On Fri, Feb 10, 2017 at 10:01 AM, Eddie James
<eajames@linux.vnet.ibm.com> wrote:
> Looks good to me.
>
> Reviewed-by: Eddie James <eajames@us.ibm.com>
>
>
> On 02/09/2017 02:17 PM, Christopher Bostic wrote:
>>
>> In order to access slave address ranges > 0x1FFFFF the slave ID
>> must be adjusted accordingly in the command encoding:
>>
>> ID 0: 0x00000000 - 0x001FFFFF
>> ID 1: 0x00200000 - 0x003FFFFF
>> ID 2: 0x00400000 - 0x005FFFFF
>> ID 3: 0x00600000 - 0x007FFFFF
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

via the magic of instant messaging:

Acked-by: Alistair Popple <alistair@popple.id.au>

Merged into dev-4.7.

Chris, please make sure you incorporate this fix into the series
you're sending upstream.

Cheers,

Joel
