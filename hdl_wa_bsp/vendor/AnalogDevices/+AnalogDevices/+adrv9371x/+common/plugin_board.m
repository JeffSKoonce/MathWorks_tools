function hB = plugin_board(board)
% Use Plugin API to create board plugin object

hB = hdlcoder.Board;

% Target Board Information
hB.BoardName    = sprintf('AnalogDevices ADRV9371 %s', upper(board));

% FPGA Device
hB.FPGAVendor   = 'Xilinx';

% Determine the device based on the board
switch(upper(board))
    case 'ZC706'
        hB.FPGAFamily   = 'Zynq';
        hB.FPGADevice   = sprintf('xc7%s', 'z045');
        hB.FPGAPackage  = 'ffg900';
        hB.FPGASpeed    = '-2';
    case 'ZCU102'
        hB.FPGAFamily   = 'Zynq UltraScale+';
        hB.FPGADevice   = sprintf('xc%s', 'zu9eg-ffvb1156-2-e');
        hB.FPGAPackage  = '';
        hB.FPGASpeed    = '';
    otherwise
        hB.FPGAFamily   = 'Zynq UltraScale+';
        hB.FPGADevice   = sprintf('xc%s', 'zu9eg-ffvb1156-2-e');
        hB.FPGAPackage  = '';
        hB.FPGASpeed    = '';
end

% Tool Info
hB.SupportedTool = {'Xilinx Vivado'};

% FPGA JTAG chain position
hB.JTAGChainPosition = 2;

%% Add interfaces
% Standard "External Port" interface
