Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o3LYqwKW"; 
 dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bLcn4PSDzDqwW
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 09:43:21 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id w13so10646469oiw.9
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 14:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=me9VSHNPhsk56nNJEsR34YO1aKJeD/7AwKRufepLVas=;
 b=o3LYqwKWPIX1n8sLR2FccTYyAE7sohfMmMVbMs4+30Q136/EnY0Au5hG6fdEg1DvqQ
 H/605apDCzmbRkWNy2lJdadLiNY8A+Gx1pSUrLKh4JKSLTerqUrZBC4BznvAXms3DloU
 Cw95UASkLIuvDhM8UmNw/W/LzlEQs6Ok/5aXYhUk/xVBiQe4vYn1yXcLKGx9sG3uiYMh
 2K9HoSM2SiGJfj+youuWQtMOMStvBe4qEMe+gg357VeRzrSoH46qUxTks+eKPeUaqGYy
 nFvZ3h2R6ZG7jRv/+rrqxx3a5bcyVqaE9owiTZ1bLvX3AtZvWCSdZV8H01OON3hyZari
 p3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=me9VSHNPhsk56nNJEsR34YO1aKJeD/7AwKRufepLVas=;
 b=sTKEhAw6wjnosreondGT5cLkcwLE3hrrmZRyg9ut/Idfp3SFkpmYYnh7c6ct35lFjR
 5LbzZK2/UYAf6P78cEQXm7gzon1ggNTtWm5FbbKbHl96ytbqni6/GkljUKtkAP2heqQY
 zgOhEpU3IfuqhqlkD4krO1GQYG7y5OiplO4Ap8ncIIcsTrGN4jjKAyqvSLCOsjq9mSCz
 bYvgI9pALQwE7O5m97pNivVl9VuvBiM34vFbuNSZWHuwrCNU7Eqp5H3rfUDWGO2Uet3o
 a4IhVH8Lp7rvGmy3ZzIGu4526jVhjl6v5KK134u0zNRkdeHMWUP6H4MCrZWr131sSeJ7
 v+6Q==
X-Gm-Message-State: AJcUukcvPCjLIoj7q5MjcWKoPc6TkojvS/WzA0XAPJ0pbYZ1c2opQHCP
 h2YnsbrTeDTSXLkWaF4W7zIgLLMcJy2VNrn/QCiacyQG
X-Google-Smtp-Source: ALg8bN57Kt1Bj/NT+Uofcr4aA86Nahrsms0045AtyPPtzB9Ca+q5bkNASccIn2O04ReACHdBH1GOyyoVVrn1ZZYBmHo=
X-Received: by 2002:aca:5587:: with SMTP id j129mr7915671oib.93.1547160198932; 
 Thu, 10 Jan 2019 14:43:18 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 10 Jan 2019 16:43:02 -0600
Message-ID: <CALLMt=rZvQ_yYHA9DmpHEbjNvaJgHPOkZ1qquxJp=ZYam-K-4Q@mail.gmail.com>
Subject: Redfish Software Updates in OpenBMC
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 10 Jan 2019 22:43:23 -0000

Greetings,

Recently I've started to dig into what it's going to take to fully support
our OpenBMC implementation of code update within Redfish.
Specifically, how to support our REST based upload of the .tar images for
both our BMC and BIOS.

The current flow is the following for both BMC and BIOS:

# Upload image and get hash back identifying image
hash = POST -T <file_to_upload> https://${bmc}/upload/image

# Activate the image (i.e. write it to the flash chip)
PUT -d '{"data":
  "xyz.openbmc_project.Software.Activation.RequestedActivations.Active"}' \
  https://${bmc}/xyz/openbmc_project/software/<hash>/attr/RequestedActivation

# wait for update to complete
GET https://${bmc}/xyz/openbmc_project/software/<hash>/attr/Progress

# Verify "Activation" property is set to "Active"
GET https://${bmc}/xyz/openbmc_project/software/<hash>

# If a BMC update, reboot the BMC

There are then a set of REST api's we support to query the firmware images
loaded, which one's are active, and what the priority of each. We have a
priority concept for systems that support redundant flash chips which allows
a user to quickly switch between the activated firmware image for BMC or BIOS.


Redfish defines a UpdateService schema[a]. An action available on the
UpdateService is a SimpleUpdate interface. I think the flow to use this would
look like this:

# Retrieve the URI to upload an image to
HttpPushUri = GET  /redfish/v1/UpdateService

# Upload firmware image
ImageURI = POST HttpPushUri

# Call SimpleUpdate and point it to the "ImageURI" (returned from POST) Also
# point it to the redfish "Targets" to update(i.e. /redfish/v1/Managers/openbmc)
task = POST redfish/v1/UpdateService/Actions/UpdateService.SimpleUpdate

# Call TaskService (?) to see when operations is completed
GET redfish/v1/TaskService/Tasks/<task>

The main issue with the above is the loss of our ability to have multiple
firmware images of the same type in a system and to be able to change the
priority of them to switch back and forth between them. It's also not obvious
to me what the target is for the BIOS when doing an update of it? There are OEM
options for both Actions and Properties if needed (but would be great to avoid).

I looked around a bit at other implementations of the UpdateService.
SuperMicro[b] and Dell[c] created their own OEM commands for the update
process (although Dell seems to also support the SimpleUpdate as well[d])

If any of you are reading, I'd appreciate some thoughts on why you went the OEM
route. Was it for more fine grained control? Or maybe for issues like I
highlight above with multiple image support?

We already have a good start on our UpdateService support in bmcweb:
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/update_service.hpp

So before I dig much deeper, I'd definitely like to get some feedback from
the community on what y'all are thinking with software update and redfish!


[a] https://redfish.dmtf.org/schemas/UpdateService.v1_3_0.json
[b] https://www.supermicro.com/manuals/other/RedfishRefGuide.pdf
[c] https://topics-cdn.dell.com/pdf/idrac9-lifecycle-controller-v3212121_api-guide_en-us.pdf
[d] https://github.com/dell/iDRAC-Redfish-Scripting/blob/master/Redfish%20Python/DeviceFirmwareSimpleUpdateREDFISH.py

SuperMicro OEM Examples of Software Update:
# BMC
POST https://<IP>/redfish/v1/UpdateService/FirmwareInventory/BMC/Actions/Oem/FirmwareInventory.EnterBMCUpdateMode
POST https://<IP>/redfish/v1/UpdateService/FirmwareInventory/BMC/Actions/Oem/FirmwareInventory.UploadBMC
(File)
POST https://<IP>/redfish/v1/UpdateService/FirmwareInventory/BMC/Actions/Oem/FirmwareInventory.UpdateBMC
(preserve flags)
GET https://<IP>redfish/v1/UpdateService/FirmwareInventory/BMC/

# BIOS
POST https://<IP>/redfish/v1/UpdateService/FirmwareInventory/BIOS/Actions/Oem/FirmwareInventory.EnterBIOSUpdateMode
POST https://<IP>/redfish/v1/UpdateService/FirmwareInventory/BIOS/Actions/Oem/FirmwareInventory.UploadBIOS
(File)
POST https://<IP>/redfish/v1/UpdateService/FirmwareInventory/BIOS/Actions/Oem/FirmwareInventory.UpdateBIOS
(preserve flags)
GET https://<IP>redfish/v1/UpdateService/FirmwareInventory/BIOS/

Thanks,
Andrew
