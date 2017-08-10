Return-Path: <sacnaik@gmail.com>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com
 [IPv6:2607:f8b0:400c:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSyRc1DJCzDr0G
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 05:11:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eXN7GyL+"; 
 dkim-atps=neutral
Received: by mail-vk0-x230.google.com with SMTP id n125so6350217vke.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 12:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=TIAAqD4gpUUiSUbDrGfTXOLxFcvsmMvyVl34r2EAb+Y=;
 b=eXN7GyL+KDJyZTgbfPtrGS02Nhe1+aT8ursXIKQSj3/3PU6bgMlOcSa7PI3JZz3ekH
 RRhflOek2BEoq6tIwHc8dDPb8kYCvOfg8TrxtH4HLIryuHwVfV1IkR317BgQtUwwyQ5x
 wER71BRZRjNMGUM8x1+nRky7FQx2DORF3kw2ncSAiEop+sGygFZ905k6lx8ADlOud5GE
 DSh8RBj7JvY/kcsM+NmLbpMPPcCnOrmGC7s5D8S0eZ11ISEy5C6LIczUpWMymum62eo5
 yHPc8dqc410pMCmWDBxKauUKMbb7aBiyomD3tjLEXXDb14jxMf2slIoYMEwl/M8CayEm
 DrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TIAAqD4gpUUiSUbDrGfTXOLxFcvsmMvyVl34r2EAb+Y=;
 b=gKH1eCZpdf1vXLelw64j5fLG6ZgSkd/+RRbFwyZclIVH8apFyDcKC9aYxSm1qyms+G
 8KvWSHm+e7gfp50jLbjLuHvawU16Vr37RVPeVZqFAjivrPhSxfcefPc+SP1BW4bfubDO
 wDESX2pm1l2ow+FFXvbaU7TLpD2B5rJjgu66xLEZH0gWTw+JNDP8MPl4YGq/AkPDa441
 ZzA8m2QSPEK3/UIvgGGw7MPHUA3dd0LjSpSUGUJ5ciMXuq1TJzplD1Ta61xzJJC0RkQn
 x8k6uhBcXPyS4XTlAQTlSwSaevwwjyWZDoebIEe9WjIdkJ4RjRAvrdO6o9Eo0Wqka2MU
 7KjQ==
X-Gm-Message-State: AHYfb5jhexV4QHUQM3LVcnkrGcm70y60S+mhGi/4iDpRC55mcXTMPoK9
 mphj/VLzFTqZ+xUPyk7SeCl9v2axRoyX
X-Received: by 10.31.85.135 with SMTP id j129mr5519536vkb.209.1502392296557;
 Thu, 10 Aug 2017 12:11:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.95.40 with HTTP; Thu, 10 Aug 2017 12:11:36 -0700 (PDT)
From: sachin naik <sacnaik@gmail.com>
Date: Thu, 10 Aug 2017 12:11:36 -0700
Message-ID: <CALFfRJMyenqRKq=xfhWW2O1UkQE12Xg+n_+4+Cq9HOb5zBbkpw@mail.gmail.com>
Subject: Regarding SOL application in openBMC
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a114e564826526c05566af7c4"
X-Mailman-Approved-At: Fri, 11 Aug 2017 09:39:40 +1000
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
X-List-Received-Date: Thu, 10 Aug 2017 19:11:45 -0000

--001a114e564826526c05566af7c4
Content-Type: text/plain; charset="UTF-8"

Hi All

Can anybody know how do I enable SOL functionality in openBMC?
I am using aspeed 2500 eval board.

Thanks and regards
Sachin

--001a114e564826526c05566af7c4
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hi All<div><br></div><div>Can anybody know how do I enable SOL functionality in openBMC?</div><div>I am using aspeed 2500 eval board.</div><div><br></div><div>Thanks and regards</div><div>Sachin</div></div>

--001a114e564826526c05566af7c4--
