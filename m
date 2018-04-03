Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22f; helo=mail-io0-x22f.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QW82Klj8"; 
 dkim-atps=neutral
Received: from mail-io0-x22f.google.com (mail-io0-x22f.google.com
 [IPv6:2607:f8b0:4001:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40FxJK6RSCzF29d
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 03:42:57 +1000 (AEST)
Received: by mail-io0-x22f.google.com with SMTP id d7so22981370ioc.11
 for <openbmc@lists.ozlabs.org>; Tue, 03 Apr 2018 10:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2qkY1pLdZHpY9IyNDspgUAmoIBbHwBDTeCTaO71NOnQ=;
 b=QW82Klj89/3yaq9iBto0gma9/ZqYflupszfRVqeNeTVRG9IYZCJiVz8o6/N5WvYKJA
 hpAEt2VsvHe6q0OhvkwfmozBCK+cvQJDh6u3s1iysikyIYaZmmFWEboBCPHbJfwiN8me
 gDo20LlPCIg29hC1SSLRWCe+/NYRm6HzyYz39dPKbLjSbj81dsXgNUdEzsVh6czYNaMb
 VMrz3+Cc/hBFnaKjk+uMkyhAj0faOq/JGLa8twCDfTEyh/GlMm1wKiPfZnXdUgXCXC/I
 PXqeof/aVgy4AFVtTqbp8HrF6uEK06EAf0Js87MZEK0dew9C9i2bwv5bwWkqb8rYHRKJ
 +Ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2qkY1pLdZHpY9IyNDspgUAmoIBbHwBDTeCTaO71NOnQ=;
 b=fgW/sg2eEhUCwes1EYLSZZAhI7RGyA0COxyealQDxBOsE7SD2wtE3tsDhbh51KTX3p
 LhvkZJZYwBYIMKlcboYDDNcsrbkj/fQ29vcOUOQHrccErWC+nME2BXQvlMTvE7enZotS
 ApxkyXrokj2OUDVo24TflBanBdwg/YHqenrjrDDtBEBMgRFjtIZQEfHo5+a0dpDmswXa
 puMnOZOTJn/66eBOc+xLKyhhneAEo8mBiRcZ9QQyaZofs8QZNEtBpK8dCG94kr3tizFZ
 xau1DC8Vum6oPO1+LGaP0FV8tB1qfRgLBes8Aj5vXKSzYjHh6xQpyU2dmbJYfnwbNzh5
 XXSw==
X-Gm-Message-State: ALQs6tAT76y4JXDvcL0NOWOa30YEUJnN9AEb8u2e5aEgFgy4PqWV8kxO
 norPmCJmTCQDJ5/OB9WJZeefEMeAFYv7M6S93JoefQ==
X-Google-Smtp-Source: AIpwx49pMgt2o4nFdlvdXsdSHeLOYaAfClp6VUxUCUhH7Anaq7tiQNFsYinlTJXWeyXkA1AS/7iXoSTBR4v5wH7M3Es=
X-Received: by 10.107.172.65 with SMTP id v62mr13994126ioe.160.1522777375270; 
 Tue, 03 Apr 2018 10:42:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.192.164.169 with HTTP; Tue, 3 Apr 2018 10:42:54 -0700 (PDT)
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Tue, 3 Apr 2018 12:42:54 -0500
Message-ID: <CAG5Oiwhm3hi58JXmnDhD5xs89L_cMcnHOFkfzEzunzPtu4FypQ@mail.gmail.com>
Subject: My OpenBMC introduction - it's official!
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="94eb2c059220866c250568f53cbe"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 17:42:58 -0000

--94eb2c059220866c250568f53cbe
Content-Type: text/plain; charset="UTF-8"

With 20 years in open source and almost 6 years in OpenStack, I have
officially moved within IBM to work on the OpenBMC project. Some of you may
recognize me from previous calls and events I have been on over the past 6
months, but now I'm wrapping up my OpenStack responsibilities and switching
to OpenBMC full time.

I will spend most of my time working on cross-community topics, but will
also dive into some technical areas once I get up to speed. If I have not
met you yet, I'm excited to get to meet you. I look forward to working with
all of you.

Regards,
Kurt Taylor (krtaylor)

--94eb2c059220866c250568f53cbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>With 20 years in open source and almost 6 y=
ears in OpenStack, I have officially moved within IBM to work on the OpenBM=
C project. Some of you may recognize me from previous calls and events I ha=
ve been on over the past 6 months, but now I&#39;m wrapping up my OpenStack=
 responsibilities and switching to OpenBMC full time.<br><br></div>I will s=
pend most of my time working on cross-community topics, but will also dive =
into some technical areas once I get up to speed. If I have not met you yet=
, I&#39;m excited to get to meet you. I look forward to working with all of=
 you.<br><br></div>Regards,<br></div>Kurt Taylor (krtaylor)<br></div>

--94eb2c059220866c250568f53cbe--
