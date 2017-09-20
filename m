Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::244; helo=mail-lf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y5miI75G"; 
 dkim-atps=neutral
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxjXb2DR9zDqNm
 for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2017 11:56:46 +1000 (AEST)
Received: by mail-lf0-x244.google.com with SMTP id y15so639496lfd.0
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 18:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=GZSD1NyNUlpTBf8Xc6GKBHZHJHHfzmK4N/ZdsrspUlo=;
 b=Y5miI75GQ9yaGERh9cqk4Jvj47S9NNR4GZDYiVHo9lH5L3bA36outuLibmn3U74M3T
 yq0Y4FcO8VnmFHY215lLLJzp2h0B4ZIMoqjW5QbUgxBW3jjP+T6JFtw3QRcUSjH0t4Vn
 TOWjolfp872tAbpO0ZcymLPZu4NbQITTgCZuREDXhAimsgho3oG04VRLjHP9lCQedzRE
 811YlyeMEsQjIkp0WlPUZVjLD2AevpVfzDEVVxE0x4xTiw4dFlMRITPQFjXc/e3MSqTK
 FsQSroYYAn3c19xN30amn6wV5P5LFd/jAuNoKZUqmwZ8gy+wdYbD2ht0EiaDnpRZUhzA
 uNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=GZSD1NyNUlpTBf8Xc6GKBHZHJHHfzmK4N/ZdsrspUlo=;
 b=DDK80Pvev24eKS3pHo7bZC3vNGcgTpYA0zdihVfbfdw4NYIojahH5gGNMPHHfhV2Xr
 r22qTyviE6eujS+bVGsi/vkndNJC/OSJSwroeRsZXb5Wzk/Yd/mwA8DqfpzeEaJvK5fz
 keZFvAOr+/Oc60pK3uY1TRzvwCCnjAL1kNhdvBWv76dgthmTOHd8Q5i7Cnh8P7MAAFqS
 W7msc3RHhSFkZkz+WpzMTQNwVdk0nIcU6+ql0eL6EqOSwSZi8KjMn/e7q38oH0ttdYu8
 /k35ZqG8GFGSv43nkJgOisQFDOwJ6z1aRHxGHg8Tm0TVY3RiuqARnSrSEdWGY839x2ts
 E2zw==
X-Gm-Message-State: AHPjjUjKEb37X4+1ZFD0XRkMLnQERCbJQRqxU8QzBDo+yX3mMAANMS0I
 IbAbnZ4gHeX9ETGowV4raEmVtQTyooTF7lt7Mzk=
X-Google-Smtp-Source: AOwi7QCVG9eBI97NrUD9H2UB5dWIzrrSwPxis4RZlnuuMGpWrDFS9i43ZQdy7gd06nc5p2pQbhtcZJA+Wn159GGKwAY=
X-Received: by 10.46.86.146 with SMTP id k18mr1583043lje.81.1505872603905;
 Tue, 19 Sep 2017 18:56:43 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 19 Sep 2017 18:56:23 -0700 (PDT)
In-Reply-To: <1505852386-4038-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1505852386-4038-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Sep 2017 11:26:23 +0930
X-Google-Sender-Auth: WG_IjyLHckXQgHJOCXWfSEGovt0
Message-ID: <CACPK8Xd8njPyOU6geMLdV+5fb7p8O0OF3UxEBxDVvhMa571Lbg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] drivers/hwmon/occ: Add reference count
 and switch to non-blocking read
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Sep 2017 01:56:48 -0000

2017-09-20 5:49 GMT+09:30 Eddie James <eajames@linux.vnet.ibm.com>:
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 34002fb..15f156e 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -118,6 +118,12 @@ struct extended_sensor {
>         u8 data[6];
>  } __packed;
>
> +/* not available in 4.10 */

I'd prefer to backport an upstream patch.

It looks like 4.10 does have kobject_get_unless_zero, it's just not
exported. I will backport c70c176ff8c3 "kobject: Export
kobject_get_unless_zero()" from upstream and you can drop this hunk.

> +static bool kobject_get_unless_zero(struct kobject *kobj)
> +{
> +       return kref_get_unless_zero(&kobj->kref);
> +}
> +
