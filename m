Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NDzxEBNI"; 
 dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43h47d1j5VzDr2P
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jan 2019 02:07:56 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id u16so14613342otk.8
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 07:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=odZKec6GnZRxqqrW+XCf2eKuFvbFUngKhWf+XYhvyXg=;
 b=NDzxEBNIJKcRudzVa1BfSOFC0EnKNqrcNT9RfI0FuYmHQIXU2hJ0l5Ldw8PqumutkQ
 tjZOnt2fWyL75gxmbUDrjei/pPfOMsCumLKGz3hmFRylGxuhGWR890DzrIPfcpNduFJ3
 r4GnZ7l905cqu7PZITBVLToJMqw1BbNFrgb5eebyvGGkioDKWxo8pE0quv38+alt0REM
 DFtWHps4uJ4jMD2zG0oi4/Q134EcVXV60FFPfXzQDBiC2iNJvyAUWlcnd5pgIqmLumwm
 3/AOYhbF6EXLTV3bumScI3GsWorXbu9+TGANUXEAZUk5ZMu/OIjUuls4SKvbnvQrElZu
 2afQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=odZKec6GnZRxqqrW+XCf2eKuFvbFUngKhWf+XYhvyXg=;
 b=iWi0DinE79DgdVBh/UdO0zdduYPHoHqxEcpp2S2QXiI2kXRXrPNjxBnfalJXIult+l
 E9m+5N4mnY6t4W/uF9t+K1ioY40zcV0XCJsuYbUc7fNZ+Uec9w/7adrNDuQHQCkz5M0x
 gyIDNoSCqHjxuKCe3Lu/6qWW+E0jr8AfQT13hxZoKw/oHIG5N8tXbBDP20OSexXMXPIl
 9LgIzJRfd1ygYejk74/FcmBVNSmT4v/0NhdLYjAgKXgYeg2n3VHYABzjH10/y574zgrU
 67gOHWqpbrxUCGRu9hMJzrvX5zag7CVZQPIZsJnHKm2n1FiH/QC8P8kttY/mKd3bf2SZ
 fM7Q==
X-Gm-Message-State: AJcUukeBiY/A4cOgsVGcy/+Y9lNV1NDGSUJUwO7TFiYdIaJuT8yDqhxK
 QFpq61js3Szrw9DYjl/CaXsSwcU0
X-Google-Smtp-Source: ALg8bN7EUnWSEyrqYylH1ylUVeIduMVIExYRaB6eLYFzp2RZkQNMTjzT503zsc2d5XqRoUCQTE+xDQ==
X-Received: by 2002:a9d:2186:: with SMTP id s6mr12619390otb.346.1547824074122; 
 Fri, 18 Jan 2019 07:07:54 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id v20sm1952352otk.77.2019.01.18.07.07.52
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 07:07:53 -0800 (PST)
Subject: Re: Openbmc test Release tagging for Community Release
To: openbmc@lists.ozlabs.org
References: <OFF42ED130.9BA22149-ON00258385.005A6773-65258385.005B63D6@notes.na.collabserv.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <ecb9f90c-958b-219b-160c-11ee09a72ecb@gmail.com>
Date: Fri, 18 Jan 2019 09:07:52 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <OFF42ED130.9BA22149-ON00258385.005A6773-65258385.005B63D6@notes.na.collabserv.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 18 Jan 2019 15:07:58 -0000

On 1/17/19 10:38 AM, George Keishing wrote:
> Hi All,
> 
> We are going to tag a openbmc test release soon for the community master 
> release testing. So, expect 2.3 tag version soon there in a week time 
> from now, once the test code and master are stable.

No, we are in the middle of a test cycle for the 2.6 release. We agreed 
and switched from the informal tags to a formal release process last 
June/July. Why do we need to tag master at an earlier level? Please come 
to a release planning meeting and let's talk about what you need.

> As part of the release tagging in test, we are freezing any new changes 
> for now in test except for CI/CT fixes required to support testing the 
> Master 2.6 .

I don't understand this at all. What is "release tagging in test"? We 
have a 2.6 branch and master (which is also at 2.6+ level).

Kurt (krtaylor)
