Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::233; helo=mail-oi0-x233.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uNXMjXqr"; 
 dkim-atps=neutral
Received: from mail-oi0-x233.google.com (mail-oi0-x233.google.com
 [IPv6:2607:f8b0:4003:c06::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 429SY14CFgzF36h
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 02:53:57 +1000 (AEST)
Received: by mail-oi0-x233.google.com with SMTP id x197-v6so5108761oix.5
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 09:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=E7+Ee1szKrcOtacdVNXe+3v+VWkGCUg0F7KDyz+X5fw=;
 b=uNXMjXqrLzZhGavDbT57OjqBgDtDaVGoLBDSkLDgI2KhhQt1K//NGnU7kDy0/i1vjY
 4lPuw57/x/TVzMTbaDSqlRfMaRI/LJZATHDmWYiafuAh0Nk7cqaNQFsfoN4F7xmpSP6t
 Pz7Ru+CqpB0rziyevihb2bwD9XvPZcTaXe7xd2iBvcnGEv7Xez6t0zlHOS5FYGuQZAKQ
 G9R9EX1xbK85geApFYKxRVKusEgD4J0RNxLAQd7SVZ2P0S2dWTkQ4V/1HNM+sP0UbR4R
 o1WRjo4OGLfzPBHYLlhuS6+wPXQYmsZJthZ3unDkMADVhr8XdPz8HHy5h5jyDRqMCS+3
 NMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=E7+Ee1szKrcOtacdVNXe+3v+VWkGCUg0F7KDyz+X5fw=;
 b=bknHWlC5kYsxB876CX75hrqgbfoCV2lnLvUQH71nKMfptnGSS0PQhcWRycxxJ+ZHgl
 BYvyL41iKpd65N02jfbsfBMfRsLKxIbgO85LF8hmAUV9Up/jtX+GpVqc1LWtpn96yD+6
 j+q47macSPar/ejBuRfpCUW56spWvbLUV9EBfnNV40NBnDEFw1IHhLYqUYslH5RqjNXm
 EVfmM7oFIXVtgwyty2VtW+QzEbZOyiDdN48IS9dr+Nq+hsKJEOX5C4wbwXrsVqOHgHiP
 XWj1WgGwVWR6JrL0WPRrDk9nUKawIsoJT6BMluTuNzzGQPYkaSpJQT5ReFjjjJrfTL4h
 nVWA==
X-Gm-Message-State: APzg51AhbMVa5271jjYfXXdBZaw6+pJFzbDEFIY9Fm/vUYV3aS9Hh1Uu
 JtSWYuokEO5xUmmPF948jVxJfA3T
X-Google-Smtp-Source: ANB0VdbOpOuXSbSDI0YEWCn1R5OBQ71IbunZflitDgoY1dgrJ3GmTlNalfK6c12Gvhqo/b94DAg7MA==
X-Received: by 2002:aca:6044:: with SMTP id
 u65-v6mr2954165oib.323.1536771234110; 
 Wed, 12 Sep 2018 09:53:54 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id w84-v6sm815104oie.40.2018.09.12.09.53.53
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Sep 2018 09:53:53 -0700 (PDT)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: OpenBMC Fix-it vSprint - September 24-25, 2018
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <3d8f7871-75a6-4677-3cc4-64e4e226291b@gmail.com>
Date: Wed, 12 Sep 2018 11:53:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Wed, 12 Sep 2018 16:53:58 -0000

Hi all,

I'd like to announce the OpenBMC Fix-it virtual Sprint, September 24-25. 
This time we're going to use IRC to communicate/organize and span 2 full 
days to allow for more global participation.

I'll email more specifics as we get them nailed down. But, for now, get 
those ideas coming for what we can accomplish. Keep the ideas fairly 
small, something we can finish or almost finish in a 2 day period. Put 
them here:

https://docs.google.com/spreadsheets/d/1j4cpTGcUPUZzW4WT1vI0iFVVJApSBbVEvrZJInhI30U/edit?usp=sharing

NOTE: the idea is to participate however and whenever you can, you do 
not need to work solid for 2 days - just jump in where you can and 
communicate much more than you think you should - if you can help for a 
full day great, but helping for 2 hours is also good!

Thanks!
Kurt Taylor (krtaylor)
