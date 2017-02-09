Return-Path: <alistair@popple.id.au>
Received: from ipmail07.adl2.internode.on.net (ipmail07.adl2.internode.on.net
 [150.101.137.131])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vK2bP5QrmzDq5s
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 02:50:25 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2A+BQBSj5xY/zhuYSBdGwEBAQMBAQEJAQEBg1GBaoMLgi2aM5MnhBuGIgKCalcBAgEBAQEBAmIohGkBAQEDAScTPwULCw0BCgkUARAPAUcGE4lsC7F5OiYCiyABAQEHKIs7ijkFm3CKDYhugRKFF4NEhi+TE1d+EQ4PBAgRGYUAHRmBXCw1AYh9AQEB
Received: from unknown (HELO new-mexico.localnet) ([32.97.110.56])
 by ipmail07.adl2.internode.on.net with ESMTP; 10 Feb 2017 02:20:20 +1030
From: Alistair Popple <alistair@popple.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Adjust slave ID based on
 address in command send
Date: Fri, 10 Feb 2017 02:50:05 +1100
Message-ID: <2568911.gMj68Ijx19@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <645a4ecb-ce9f-5218-6b26-a0dc6d5cfc3e@linux.vnet.ibm.com>
References: <20170208233350.56069-1-cbostic@linux.vnet.ibm.com>
 <12493797.UHNVbxk1rO@new-mexico>
 <645a4ecb-ce9f-5218-6b26-a0dc6d5cfc3e@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
X-List-Received-Date: Thu, 09 Feb 2017 15:50:25 -0000

On Thu, 9 Feb 2017 09:00:29 AM Christopher Bostic wrote:
>
> On 2/8/17 8:54 PM, Alistair Popple wrote:
> > On Thu, 9 Feb 2017 10:48:13 AM Joel Stanley wrote:
> >> On Thu, Feb 9, 2017 at 10:03 AM, Christopher Bostic
> >> <cbostic@linux.vnet.ibm.com> wrote:
> >>> In order to access slave address ranges > 0x1FFFFF the slave ID
> >>> must be adjusted accordingly in the command encoding:
> >>>
> >>> ID 0: 0x00000000 - 0x001FFFFF
> >>> ID 1: 0x00200000 - 0x003FFFFF
> >>> ID 2: 0x00400000 - 0x005FFFFF
> >>> ID 3: 0x00600000 - 0x007FFFFF
> >> Alistair and Eddie, can I please get an ack from both of you on this?
> >>
> >>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> >>> ---
> >>>   drivers/fsi/fsi-master-gpio.c | 20 ++++++++++++++++----
> >>>   1 file changed, 16 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> >>> index 73d9985..428f3db 100644
> >>> --- a/drivers/fsi/fsi-master-gpio.c
> >>> +++ b/drivers/fsi/fsi-master-gpio.c
> >>> @@ -30,7 +30,9 @@
> >>>   #define        FSI_GPIO_CMD_READ       0x0400000000000000ULL
> >>>   #define        FSI_GPIO_CMD_SLAVE_MASK 0xC000000000000000ULL
> >>>   #define        FSI_GPIO_CMD_ADDR_SHIFT 37
> >>> -#define        FSI_GPIO_CMD_ADDR_MASK  0x001FFFFF
> >>> +#define        FSI_GPIO_CMD_ADR8_MASK  0x001FFFFF
> >>> +#define        FSI_GPIO_CMD_ADR16_MASK 0x001FFFFE
> >>> +#define        FSI_GPIO_CMD_ADR32_MASK 0x001FFFFC
> >>>   #define        FSI_GPIO_CMD_SLV_SHIFT  62
> >>>   #define        FSI_GPIO_CMD_SIZE_16    0x0000001000000000ULL
> >>>   #define        FSI_GPIO_CMD_SIZE_32    0x0000003000000000ULL
> >>> @@ -40,6 +42,9 @@
> >>>   #define        FSI_GPIO_CMD_DFLT_LEN   28
> >>>   #define        FSI_GPIO_CMD_CRC_SHIFT  60
> >>>
> >>> +#define        FSI_SLAVE_SHIFT         21
> >>> +#define        FSI_SLAVE_MASK          0x3
> >>> +
> >>>   /* Bus errors */
> >>>   #define        FSI_GPIO_ERR_BUSY       1       /* Slave stuck in busy state */
> >>>   #define        FSI_GPIO_RESP_ERRA      2       /* Any (misc) Error */
> >>> @@ -301,15 +306,17 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
> > Do we need to expose the slave-id outside of this function? Ie. does
> > anything currently (or is expected to in future) pass anything other
> > than slave=0 to this function? If not we should drop slave-id from the
> > function parameters imho.
> >
> There are cases where the core scan code will need to pass in slave-id 3
> during
> link initialization.  Also the core is structured to deal with the
> eventual case
> where we may have multiple CFAMs per link so I think it makes sense to
> keep it as a parameter.

Ok, I wasn't sure but given that it makes sense to keep it. The code
looks good otherwise.

> >>>                  const void *data)
> >>>   {
> >>>          uint8_t crc;
> >>> +       uint32_t addr_mask;
> >>>
> >>>          cmd->bits = FSI_GPIO_CMD_DFLT_LEN;
> >>>          cmd->msg = FSI_GPIO_CMD_DEFAULT;
> >>>          cmd->msg |= mode;
> >>> -       cmd->msg &= ~FSI_GPIO_CMD_SLAVE_MASK;
> >>> +       if (!slave)
> >>> +               slave = (addr >> FSI_SLAVE_SHIFT) & FSI_SLAVE_MASK;
> >>>          cmd->msg |= (((uint64_t)slave) << FSI_GPIO_CMD_SLV_SHIFT);
> >>> -       addr &= FSI_GPIO_CMD_ADDR_MASK;
> >>> -       cmd->msg |= (((uint64_t)addr) << FSI_GPIO_CMD_ADDR_SHIFT);
> >>> +
> >>>          if (size == sizeof(uint8_t)) {
> >>> +               addr_mask = FSI_GPIO_CMD_ADR8_MASK;
> >>>                  if (data) {
> >>>                          uint8_t cmd_data = *((uint8_t *)data);
> >>>
> >>> @@ -317,6 +324,7 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
> >>>                                  ((uint64_t)cmd_data) << FSI_GPIO_CMD_DT8_SHIFT;
> >>>                  }
> >>>          } else if (size == sizeof(uint16_t)) {
> >>> +               addr_mask = FSI_GPIO_CMD_ADR16_MASK;
> >>>                  cmd->msg |= FSI_GPIO_CMD_SIZE_16;
> >>>                  if (data) {
> >>>                          uint16_t cmd_data;
> >>> @@ -326,6 +334,7 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
> >>>                                  ((uint64_t)cmd_data) << FSI_GPIO_CMD_DT16_SHIFT;
> >>>                  }
> >>>          } else {
> >>> +               addr_mask = FSI_GPIO_CMD_ADR32_MASK;
> >>>                  cmd->msg |= FSI_GPIO_CMD_SIZE_32;
> >>>                  if (data) {
> >>>                          uint32_t cmd_data;
> >>> @@ -336,6 +345,9 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
> >>>                  }
> >>>          }
> >>>
> >>> +       addr &= addr_mask;
> > How is the masking of the address different now that you are setting
> > the slave-id? Ie. this change looks more general than just setting the
> > slave-id so is it fixing a different probelm? Or is somehow related to
> > setting the slave-id?
> >
> Its not directly related to the slave ID.  I added this to ensure that
> any callers
> that request odd alignments, i.e.  32 bit write aligned on address 0xFFFF is
> properly masked.

Unless we expect odd alignments for some reason I think it would be
best to return an error (eg. -EINVAL) when an incorrect alignment is
passed. It's not always obvious that fixing alignment is the correct
behaviour in these cases - callers may expect something different and
returning an error forces them to work out what that is.

> Since it is separate conceptually I'll break this part out into a
> separate patch.

Please do, thanks!

> Thanks,
> Chris
>
> > Regards,
> >
> > Alistair
> >
> >>> +       cmd->msg |= (((uint64_t)addr) << FSI_GPIO_CMD_ADDR_SHIFT);
> >>> +
> >>>          if (mode == FSI_GPIO_CMD_WRITE)
> >>>                  cmd->bits += (8 * size);
> >>>
> >>> --
> >>> 1.8.2.2
> >>>
>
