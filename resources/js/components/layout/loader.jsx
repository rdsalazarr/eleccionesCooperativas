import logo from "../../../images/logo.png";
import { Box } from "@mui/material";
import "../../../scss/loader.scss";

export default function Loader(){
    return (<Box className={'loader'}>
                <Box className={'img'}>
                    <img src={logo} />
                </Box>
                <Box className={'ldsEllipsis'}>
                    <Box></Box>
                    <Box></Box>
                    <Box></Box>
                    <Box></Box>
                </Box>
            </Box>)
}

export function LoaderModal(){
    return (<Box className={'loaderModal'}>
                <Box className={'img'}>
                    <img src={logo} />
                </Box>
                <Box className={'ldsEllipsis'}>
                    <Box></Box>
                    <Box></Box>
                    <Box></Box>
                    <Box></Box>
                </Box>
            </Box>)
}