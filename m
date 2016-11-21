Return-Path: <clg@kaod.org>
X-Greylist: delayed 527 seconds by postgrey-1.36 at bilbo;
 Mon, 21 Nov 2016 21:31:17 AEDT
Received: from 11.mo3.mail-out.ovh.net (11.mo3.mail-out.ovh.net
 [87.98.184.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMlJ54XHdzDvxq
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 21:31:16 +1100 (AEDT)
Received: from player734.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 49587605EA
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 11:31:14 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 6CE9A2800C8;
 Mon, 21 Nov 2016 11:31:12 +0100 (CET)
Subject: Re: [PATCH qemu 23/38] block: add a model option for MTD devices
To: Joel Stanley <joel@jms.id.au>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-24-git-send-email-clg@kaod.org>
 <CACPK8XeAGarVEu1r8GGmPZJnSo_3O_wrwjkZkJF9Tijqaz9yhw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b0bcb8aa-0699-7d9e-3cb5-4e2591bd8f5a@kaod.org>
Date: Mon, 21 Nov 2016 11:31:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeAGarVEu1r8GGmPZJnSo_3O_wrwjkZkJF9Tijqaz9yhw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14767866129627974402
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdefgddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 21 Nov 2016 10:31:18 -0000

On 11/21/2016 08:27 AM, Joel Stanley wrote:
> On Sat, Nov 19, 2016 at 12:52 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> This could be used to define the flash model to use on some boards
>> definitions.
> 
> Nice, I like it.
> 
> Could we add an option specify the mac/ncsi setup of the system too?
> Some hardware will have a NCSI device on one MAC and a PHY on the
> other. It would be handy to be able to test those without adding a new
> board.

we could use a property at the machine level and propagate in the 
sub device models :

	-machine [type=]name[,prop[=value][,...]]

or directly use a property at the network device model.

	-device driver[,prop[=value][,...]]

C. 


>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
>> ---
>>  blockdev.c                | 13 +++++++++++++
>>  include/sysemu/blockdev.h |  1 +
>>  qemu-options.hx           |  4 +++-
>>  3 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/blockdev.c b/blockdev.c
>> index 245e1e1d177a..fcea923edf02 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -742,6 +742,10 @@ QemuOptsList qemu_legacy_drive_opts = {
>>              .type = QEMU_OPT_STRING,
>>              .help = "pci address (virtio only)",
>>          },{
>> +            .name = "model",
>> +            .type = QEMU_OPT_STRING,
>> +            .help = "flash model (mtd only)",
>> +        },{
>>              .name = "serial",
>>              .type = QEMU_OPT_STRING,
>>              .help = "disk serial number",
>> @@ -790,6 +794,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type)
>>      bool read_only = false;
>>      bool copy_on_read;
>>      const char *serial;
>> +    const char *model;
>>      const char *filename;
>>      Error *local_err = NULL;
>>      int i;
>> @@ -1030,6 +1035,13 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type)
>>          g_free(new_id);
>>      }
>>
>> +   /* Add virtio block device */
>> +    model = qemu_opt_get(legacy_opts, "model");
>> +    if (model && type != IF_MTD) {
>> +        error_report("model is not supported by this bus type");
>> +        goto fail;
>> +    }
>> +
>>      /* Add virtio block device */
>>      devaddr = qemu_opt_get(legacy_opts, "addr");
>>      if (devaddr && type != IF_VIRTIO) {
>> @@ -1102,6 +1114,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type)
>>      dinfo->unit = unit_id;
>>      dinfo->devaddr = devaddr;
>>      dinfo->serial = g_strdup(serial);
>> +    dinfo->model = g_strdup(model);
>>
>>      blk_set_legacy_dinfo(blk, dinfo);
>>
>> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
>> index 16432f350805..10c66e5e86a4 100644
>> --- a/include/sysemu/blockdev.h
>> +++ b/include/sysemu/blockdev.h
>> @@ -39,6 +39,7 @@ struct DriveInfo {
>>      int cyls, heads, secs, trans;
>>      QemuOpts *opts;
>>      char *serial;
>> +    char *model;
>>      QTAILQ_ENTRY(DriveInfo) next;
>>  };
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 4a5b29f349f7..16add85bd0f5 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -517,7 +517,7 @@ DEF("drive", HAS_ARG, QEMU_OPTION_drive,
>>      "-drive [file=file][,if=type][,bus=n][,unit=m][,media=d][,index=i]\n"
>>      "       [,cyls=c,heads=h,secs=s[,trans=t]][,snapshot=on|off]\n"
>>      "       [,cache=writethrough|writeback|none|directsync|unsafe][,format=f]\n"
>> -    "       [,serial=s][,addr=A][,rerror=ignore|stop|report]\n"
>> +    "       [,serial=s][,model=m][,addr=A][,rerror=ignore|stop|report]\n"
>>      "       [,werror=ignore|stop|report|enospc][,id=name][,aio=threads|native]\n"
>>      "       [,readonly=on|off][,copy-on-read=on|off]\n"
>>      "       [,discard=ignore|unmap][,detect-zeroes=on|off|unmap]\n"
>> @@ -570,6 +570,8 @@ the format.  Can be used to specify format=raw to avoid interpreting
>>  an untrusted format header.
>>  @item serial=@var{serial}
>>  This option specifies the serial number to assign to the device.
>> +@item model=@var{model}
>> +This option specifies the model to use to create a flash device (if=mtd only).
>>  @item addr=@var{addr}
>>  Specify the controller's PCI address (if=virtio only).
>>  @item werror=@var{action},rerror=@var{action}
>> --
>> 2.7.4
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
