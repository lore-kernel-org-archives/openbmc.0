Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y/EhVNft"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLd1k17rkzF0R6
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 04:46:17 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id u76so21837895qku.11
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 09:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Emh2j+Yr6LNpFFurNv9/sBwQYc2ujqNagBFU8IWizcM=;
 b=Y/EhVNfthmnIz1glmAPduBG2UTsQuOlNykaFXiI0H7VVKezNGnUXEnJLLdd7K7jzyX
 tg13TycbgycQb8yFE7iCRn/ccYUkaqsNjzPSIhBzv+vbmFfzvSdW0C2CbWqd+I4yKQKX
 zm2niEn8LgcBi1TKqBXorgHHZY8CfCEi8YdZ6Db67tYvouzZVNTtLljC+hF7veqvSm0V
 VsDAmTKOilC2beQvMEp86ez1TOkQRjFOOTvl6Jldzb6/RhZlEYKpatqYy5NsMBvTbZ7n
 mkvwNofSVZcB04dTVonc5XAcV4WObxNT6bU0h9YI/ynDsChx8JKg0e59NvZ9bYnER+tD
 kvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Emh2j+Yr6LNpFFurNv9/sBwQYc2ujqNagBFU8IWizcM=;
 b=sUywUa4GqGxXT2f6wapv5YJU+D/9FKQcXSnSxN7e0oPbqAeIg6t7NYJ41N+H5amRnq
 ArHQ2TzrugJcWaEKgsElyBL6NmuXVTIXfB6eXi4UsGYQ7rAnNHFjNarA5SaNP8jV9MX9
 +//8D6maYoe9tAeIeyurx8kcIITJ2FvqPrHss4PrlZUULnKpNQZeMRN8gBZM1f9ftjps
 mbMFEygYNAHhs9xYgc5H/rOofHGPyP23xqC3U4C9lzY3hN9HP6hhXh6cEuBaSh/hRV07
 2plVHPbyL+jerToa47JD4m3dZtbIK9ZyH+FjIKc3WN3GJ97SCu99zM8ym3yK4RFJSAxJ
 sM+A==
X-Gm-Message-State: AKwxytfLlgWG6skeWHT9X2aMM9s8uvTrbELSN0oZmDNCRpXvJRIlnDCt
 82khUfmTKRGCwTXmbIW+uGCnq+Gjz0XwJmjX0K9EkwMB
X-Google-Smtp-Source: ACJfBou0UzN8Kd2HahwF/aFCN/jIrlF9vZ18Daxv0E5tR/FtpVMqBjvTub1MAtTEfirLKxlEFvr2CDuwSZUokGAI19w=
X-Received: by 10.55.115.7 with SMTP id o7mr51727228qkc.135.1516124775440;
 Tue, 16 Jan 2018 09:46:15 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Tue, 16 Jan 2018 09:45:54 -0800 (PST)
In-Reply-To: <1513713393-10030-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1513713393-10030-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jan 2018 11:45:54 -0600
X-Google-Sender-Auth: dewQGZz67nZD8eRlJ7dCPOaV13M
Message-ID: <CACPK8Xfsr6FznoiYiWk+uz1aWEwFi7NF540Qh7pfpCK6UN=QSg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3] hwmon (occ): Fix integer overflow in
 multiplication
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Tue, 16 Jan 2018 17:46:18 -0000

On Tue, Dec 19, 2017 at 1:56 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> Power values were overflowing INT_MAX when being converted to
> microwatts, even though the storage was sufficiently large (unsigned 64
> bit). Change literals to unsigned long long. Also change tmep storage to u32
> to avoid overflows at 65000 millidegrees.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to dev-4.10.

Cheers,

Joel
