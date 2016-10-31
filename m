Return-Path: <xow@google.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t77lS0VfjzDvLj
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 09:07:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=TIA+XlN+; 
 dkim-atps=neutral
Received: by mail-qk0-x231.google.com with SMTP id o68so180088948qkf.3
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 15:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=izH6PXV0jGwYPWU4FzYrUzsNCXB1IYQp5uSyiXTQYWU=;
 b=TIA+XlN+PxT5hhJIZFEvtyHVlvI1GIRkV1ZJ2OewuFi3KHmZLBzPMUouOBR1URzv/t
 RIrMBnH1Ro9LtPUFXQCKdQczZYnJFhjhwvrO2q19IL3Lzl6UrU0b00H4dGOYbSGFcDuH
 /zpAg+JQyLAXnBwLMo830pB1ONV4TVPF3F1XJxyHcJld/IICRES0dziehdSbme65uQiH
 xcSgqXXRoPQYqvQ1ry7/bXP6bMqGye2MkN9vJndMadvZNyRnKhQ86BWZNISAoTlFeBo5
 8q0/wcMb6UrvNMb7Ra+tLgVFoKweHXXR7xVZKbfPHlNx8Ei/iwzbpUXEY6Wd8F0rHWuF
 bcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=izH6PXV0jGwYPWU4FzYrUzsNCXB1IYQp5uSyiXTQYWU=;
 b=TPph88r6t82W1kVDUKeqa1g3SqPkRh9R/BOvtiFUA3qZ4N6gEPMziIzBVLahsELd7z
 bHRLQ3uib7tRsft8kFa8NTLCYTWuJPFrqW/7prm1c+eQGEd4LSTv0Qmm77gwHfKOvyYx
 VRzy1Iq+0ZjRxnEnWGSJ9HnWWtkRrl7qNseXEouUvutSQH26DIMMizUOQbfxZpU1oLIK
 esu55WG7qEQUjN342L9e9Kj3DspULyQnAFuNONQS7gScKcAcpxb86Z0m0AkRKyngcUX+
 cupC7eY0HZGI4bgnTGGpzoFH6bbEa090Xfd5R/u7RhWvr0bgDrIibNeST1QkiWhpISjo
 e2cA==
X-Gm-Message-State: ABUngvcksRUS11Y/OU3RhdRoOPTr/DeV0YFXcdB1xgth8W1vrWEZd63Gg4LcNee2H3Tsj7WZvXf5RduevG7jRIxR
X-Received: by 10.55.17.143 with SMTP id 15mr31265773qkr.297.1477951664439;
 Mon, 31 Oct 2016 15:07:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.58.194 with HTTP; Mon, 31 Oct 2016 15:07:43 -0700 (PDT)
From: Xo Wang <xow@google.com>
Date: Mon, 31 Oct 2016 15:07:43 -0700
Message-ID: <CAPH-5w4nfO02yQp_mjZhS2hp9UJUTCyLTZMQMNFO06zTshFqmg@mail.gmail.com>
Subject: Jenkins down?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 31 Oct 2016 22:07:48 -0000

Hi folks,

I noticed that the CI links in Gerrit are broken. Example:

https://openpower.xyz/job/openbmc-build-gerrit-trigger-multi/903/

Is this from an update?

thanks
xo
