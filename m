Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="MndsEpWh"; 
 dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43w1M45lP1zDqNw
 for <openbmc@lists.ozlabs.org>; Thu,  7 Feb 2019 12:44:16 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id b8so10343908qtj.1
 for <openbmc@lists.ozlabs.org>; Wed, 06 Feb 2019 17:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OzhBcKuAfYNUNu2NYeQPSsZzQmcCAVnPdlfumMVLQbM=;
 b=MndsEpWhyfu8N9HJzf+X+egXMMI3rZTR9qhT9qQRNAIs7zMzKzP2j/Ti+gRjRpxcFt
 9tEckacP3fwaSk/W9EsO3J7RUKhO88WgvT5PoiKUWBE37d22lOXn5YGPZDDSwNy1jcRd
 1Z8dhVgM0kfbqqVEhZpeGR/TDbi4bfHowhcb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OzhBcKuAfYNUNu2NYeQPSsZzQmcCAVnPdlfumMVLQbM=;
 b=UNXw5GFLJKt7XIuwy7KlVqlO771hE5Ivs8ixbk6k0TOWwknZR/JAsHy/pCVzAyNjKG
 ucvXsKZsI49ZVbjhkszRwqZxqmhjQLcqIB4Fw45FMrg6hFtTKo92NnhPyRXNdjapjCJ+
 2WKF6OsQ+HXCna4COs5Xu2bkOndXC/j1IClJaeUw0hHkcC97YxIVkFtedgF+TLccY50j
 4HAApFDDAsytYY5c1FK2Ze0HOdLohjAs/fjciyBx6B/LIr1kTNuzYTKxJdKNGbroA3oZ
 yiXlBHs7ndm1jG6PlJjMa2aTQItL+QH6HiLLR4tMl6hJJ5v8MnK8ITN0XQx642DJwbIj
 2gYw==
X-Gm-Message-State: AHQUAuYGP7mYGkQXetYE/btDbTOOYMoPcAdXeKSD8A3GdSUWHIVoPEeq
 9cNTpR3TFPSa8cxWWtlBGTctJPkqo4yQAf3tGPM=
X-Google-Smtp-Source: AHgI3IZQXi5xXZWORShs02qGevQyX8uZMljaxMtdqkb0UZZpQFGiRCbZK/EK2rx1gxOch1BBO7oE3JB51tsdrVoa9AE=
X-Received: by 2002:a0c:9592:: with SMTP id s18mr7490545qvs.85.1549503853855; 
 Wed, 06 Feb 2019 17:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
In-Reply-To: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Feb 2019 12:14:01 +1030
Message-ID: <CACPK8XdhDmXXCef6h_DezHEGn8EGyvF58DbeU+UBhR6UnyUZ5w@mail.gmail.com>
Subject: Re: Secure boot for BMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Thu, 07 Feb 2019 01:44:17 -0000

On Wed, 6 Feb 2019 at 00:44, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Hi everyone
>
> Does anyone have plans to provide a secure BMC boot implementation to
> OpenBMC in the 2.7 or 2.8 timeframe?  Just trying to get a feel for who
> all wants to collaborate on this before I submit a design template.

I am interested in working on this.

Cheers,

Joel
